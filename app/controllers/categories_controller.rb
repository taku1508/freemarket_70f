class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    @category.save
  end

  private
  
  def categories_params
    params.require(:category).permit(:name,:ancestry)
  end

end

