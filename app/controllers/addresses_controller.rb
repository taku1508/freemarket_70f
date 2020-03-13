class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to root_path
  end

  private
  def address_params
    params.require(:address).permit(:address_name,:address_hurigana,:postal_code,:prefectures,:municipalities,:house_number,:room_number)
  end
end
