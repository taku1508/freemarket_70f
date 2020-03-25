# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
    @user.addresses.build
  end

  def create
    @user = User.new(users_params)
    if @user.save
      bypass_sign_in(@user)
      flash[:notice] = "新規会員登録しました."
      redirect_to root_path
    else
      redirect_to root_path, alert: '新規会員登録に失敗しました。'
    end   
  end
  private
  def users_params
    params.require(:user).permit(:nickname,:first_name,:second_name,:email,:password,
                                  :hurigana_first,:hurigana_second,:phone_number,
                                  :birthday_year,:birthday_month,:birthday_day,
                                  addresses_attributes: [:postal_code, :prefectures,:municipalities,:house_number,:room_number,:user_id])
  end
end
