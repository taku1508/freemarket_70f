class BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brands_params)
    # binding.pry
    redirect_to root_path
    # if @hoge.save
    #   redirect_to :action => "index"
    # else
    #   render :action => "new"
    # end
  end

  def brands_params
    params.require(:brand).permit(:brand,:id)
  end
end
