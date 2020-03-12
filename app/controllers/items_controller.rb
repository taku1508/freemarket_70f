class ItemsController < ApplicationController
  # before_action :set_item

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(items_params)
    # binding.pry
    # if @item.save
    #   redirect_to root_path
    # else
    #   render new
    # end
    @item = Item.new(items_params)
    binding.pry
    @item.save
    # if @item.save
    #   redirect_to root_path, notice: '商品を出品しました。'
    # else
    #   redirect_to root_path
    # end
    # binding.pry
    # redirect_to new_item_path
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  private

  def items_params
    params.require(:item).permit(:name,:description,:status,:shipping_charges,:area,:days,:price).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end