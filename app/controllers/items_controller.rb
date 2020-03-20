class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:destroy, :edit, :update]
  def index
    @item = Item.all
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
    @item.images.new 
  end
  
  def create
    @item = Item.new(items_params)
    if @item.save(items_params)
      redirect_to  items_path(@item.id), notice: 'アイテムを出品しました。'
    else
      flash.now[:alert] = 'アイテムの出品に失敗しました。'
      render :index
    end
  end


  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
    flash[:alert] = '削除しました。'
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
      end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:nickname,:description,:status,:shipping_charges,:area,:days,:price,:category_id,images_attributes: [:image,:id,:_destroy]).merge(user_id: current_user.id)
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