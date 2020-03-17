class ItemsController < ApplicationController

  def index
    @item = Item.all
    @items = Item.order("created_at DESC")
  end
  
  def new
    # @item.brands.new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(items_params)
    # @category = Category.new
    # @category = Category.all
    # @item.category = category_id
    # @item.brand_id = @item.brand
    # @item.category_id = 1
    binding.pry
    if @item.save
      redirect_to item_path(params[:id]), notice: 'アイテムを作成しました。'
    else
      render :index
    end
  end


  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm

    if current_user.blank?
      redirect_to root_path
      flash[:alert] = 'ログインを行なってください。'
    else
      @card = current_user.cards.first
      @user = current_user
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

  def items_params


    params.require(:item).permit(:nickname,:description,:status,:shipping_charges,:area,:days,:price,images_attributes: [:image,:id]).merge(user_id: current_user.id, category_id: 1)

  end

  # payjpをしようするためのメソッド
  def get_payjp_info 
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
    end

  end

end