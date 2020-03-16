class ItemsController < ApplicationController
  before_action :get_payjp_info, only: [:confirm]

  def index
    # @item = Item.all
    @items = Item.order("created_at DESC")
  end
  
  def new
    # @item.brands.new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(items_params)
    # @item.brand_id = @item.brand
    @item.category_id = @item.name
    if @item.save
      redirect_to root_path, notice: 'アイテムを作成しました。'
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

  private

  def items_params
    params.require(:item).permit(:name,:description,:status,:shipping_charges,:area,:days,:price,images_attributes: [:image]).merge(user_id: current_user.id)
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