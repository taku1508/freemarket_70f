class BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brands_params)
    @brand.save
    # if @hoge.save
    #   redirect_to :action => "index"
    # else
    #   render :action => "new"
    # end
  end

  def brands_params
    params.require(:brand).permit(:id,:brand)
  end
end
