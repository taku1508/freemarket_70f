class ItemsController < ApplicationController


  def index
    @items = Item.order("created_at DESC")
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.category_id = @item.name
    binding.pry
    if @item.save
      redirect_to root_path, notice: 'アイテムを作成しました。'
    else
      render :index
    end
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


end