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
    # @item.brand_id = @item.brand
    @item.category_id = @item.name
    binding.pry
    if @item.save
      redirect_to root_path, notice: 'アイテムを作成しました。'
    else
      render :index
    end
  end

  def  done
    @product_purchaser= Product.find(params[:id])
    @product_purchaser.update( buyer_id: current_user.id)
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
    params.require(:item).permit(:name,:description,:status,:shipping_charges,:area,:days,:price,images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end


end