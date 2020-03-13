class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    @category.save
    # if @hoge.save
    #   redirect_to :action => "index"
    # else
    #   render :action => "new"
    # end
  end

  private
  
  def categories_params
    params.require(:category).permit(:name,:ancestry)
  end

  def set
  end
end

