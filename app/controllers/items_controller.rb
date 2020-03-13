class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    # @item = Item.new(items_params)
    # binding.pry
    # if @item.save
    #   redirect_to root_path
    # else
    #   render new
    # end
    @item = Item.create(items_params)
    binding.pry
    redirect_to root_path
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:name,:description,:status,:shipping_charges,:area,:days,:price)
  end
  
end