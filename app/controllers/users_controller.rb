class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      render :show
    else
      render :edit
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname, :email, :password, :encrypted_password)
  end
end
