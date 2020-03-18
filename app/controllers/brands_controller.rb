class BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brands_params)
    redirect_to root_path
  end

  def brands_params
    params.require(:brand).permit(:brand,:id)
  end
end
