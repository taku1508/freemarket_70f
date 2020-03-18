class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(images_params)
  end

  def images_params
    params.require(:image).permit(:id,:image)
  end
end
