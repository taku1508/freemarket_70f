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

  def  done
    @product_purchaser= Product.find(params[:id])
    @product_purchaser.update( user_id: current_user.id)
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
    @item = Item.find(params[:id])
    if @item.soldout == 1
      redirect_to item_path(@item.id)
    end
  end

  private

  def items_params
    params.require(:item).permit(:nickname,:description,:status,:shipping_charges,:area,:days,:price,images_attributes: [:image, :id]).merge(user_id: current_user.id, category_id: 1)
  end

end