class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:destroy, :edit, :update]
  def index
    @item = Item.all
    @items = Item.order("created_at DESC").limit(3)
    @random = Item.order("RAND()").limit(3)
    @categories = Category.all
    @present = Category.where(ancestry: nil)
  end
  
  def new
    if current_user.blank?
    redirect_to root_path
    flash[:alert] = 'ログインを行なってください。'
    else
      @item = Item.new
      @item.images.new
      @category = Category.roots
      @category_parent_array = ["指定なし"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      @item.images.build
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def create
    @item = Item.new(items_params)
    if @item.save(items_params)
      redirect_to  items_path(@item.id), notice: 'アイテムを出品しました。'
    else
      redirect_to "/items/new", alert: 'アイテムの出品に失敗しました。'
    end
  end

  def show
    if current_user.blank?
      @user = 0
    else
      @item = Item.find(params[:id])
    end
  end

  def edit
    if current_user.blank?
      redirect_to root_path
      flash[:alert] = 'ログインを行なってください。'
    else
      if @item.user.id == current_user.id
      @category = Category.roots
      @category_parent_array = ["指定なし"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      else
        redirect_to root_path , notice: '自身の出品ではないため編集できません'
      end
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end


  def update
    id = params[:item][:category_id].to_i
    if id >= 22 && 92 >= id || id >= 106 && 154 >= id || id >= 162 && 185 >= id || id >= 193 && 217 >= id || id >= 223 && 239 >= id || id >= 244 && 248 >= id || id >= 253 && 258 >= id || id >= 263 && 268 >= id || id >= 273 && 280 >= id || id >= 285 && 290 >= id
      if @item.update(items_params)
        redirect_to root_path , notice: 'アイテムの情報を編集しました。'
      else
        render :edit, alert: 'アイテムの情報の編集に失敗しました。'
      end
    else
      redirect_to edit_item_path(@item.id) , alert: 'カテゴリーの選択を行なってください。'
    end
  end

  def destroy
    if @item.user.id == current_user.id
    @item.destroy
    redirect_to root_path
    flash[:alert] = '削除しました。'    
    else
      redirect_to root_path , notice: '自身の出品ではないため削除できません'
    end
  end

  def confirm
    if current_user.blank?
      redirect_to root_path
      flash[:alert] = 'ログインを行なってください。'
    else
      @card = current_user.cards.first
      if @card.present?
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
      @item = Item.find(params[:id])
      if @item.soldout == 1
        redirect_to item_path(@item.id)
        flash[:alert] = '既に購入されています'
      elsif current_user.id == @item.user_id
        redirect_to item_path(@item.id)
        flash[:alert] = '出品者の為、購入できません'
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
# ここを編集する
    params.require(:item).permit(:nickname,:description,:category_id, :status,:shipping_charges,:area,:days,:price,images_attributes: [:image,:id,:_destroy]).merge(user_id: current_user.id)
  end

  # payjpを使用するためのメソッド
  def get_payjp_info 
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
    end
  end

end