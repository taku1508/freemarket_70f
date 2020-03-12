class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    # if @hoge.save
    #   redirect_to :action => "index"
    # else
    #   render :action => "new"
    # end
  end

  def categories_params
    params.require(:category).permit(:id,:category)
  end
end
