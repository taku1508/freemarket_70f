# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save(users_params)
      session[:user_id] = @user.id 
      flash[:notice] = "新規会員登録しました."
      redirect_to root_path
      # redirect_to  root_path(@user.id), notice: '新規会員登録完了しました。'
    else
      redirect_to root_path, alert: '新規会員登録に失敗しました。'
    end
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
    params.require(:user).permit(:nickname,:first_name,:second_name,:email,:password,:hurigana_first,:hurigana_second,:phone_number,:birthday_year,:birthday_month,:birthday_day)
  end
end
