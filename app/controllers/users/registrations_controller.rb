# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    @user.save
    redirect_to root_path
    # unless @user.valid?
    #   flash.now[:alert] = @user.errors.full_messages
    #   render :new and return
    # end
    # session["devise.regist_data"] = {user: @user.attributes}
    # session["devise.regist_data"][:user]["password"] = params[:user][:password]
    # @address = @user.build_address
    # render :new_address
  end

  private

  def users_params
    params.require(:user).permit(:nickname,:first_name,:second_name,:email,:password,:hurigana_first,:hurigana_second,:birthday,:phone_number)
  end
end
