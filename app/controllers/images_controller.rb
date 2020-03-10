class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(images_params)
    # if @hoge.save
    #   redirect_to :action => "index"
    # else
    #   render :action => "new"
    # end
  end

  def images_params
    params.require(:image).permit(:id,:image)
  end
end
