class ItemsController < ApplicationController
  # before_action :set_category

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    # @category = category_id
  end

  def create
    # @item = @category.items.new(items_params)

    # category_id = Category.find_by(params[:item][:category_id]).id
    # Category.create(items_params.merge(category_id: category_id))
    @item = Item.new(items_params)
    binding.pry
    @item.save
    # binding.pry
    # @item.save
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

  # def set_category
  #   @category = Category.find(params[:category_id])
  # end

  # def set_item
  #   @item = Category.find(params[:id])
  # end
  # def set_item
  #   @item = Item.find(params[:id])
  # end
end