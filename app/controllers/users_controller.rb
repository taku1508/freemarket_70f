class UsersController < ApplicationController

  def index
    @users = User.all
  end

  
  def new
    @user = User.new
  end

  def create
    @user = User.create(users_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def logout
  end

  def deliber_address
  end

  def email_password
  end

  def identify
  end

  private

  def users_params
    params.require(:user).permit(:nickname,:first_name,:second_name,:email,:password,:hurigana_first,:hurigana_second,:birthday,:phone_number)
  end

end
