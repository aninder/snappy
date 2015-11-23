class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_user_session @user
      redirect_to root_path, notice: "Welcome to Snappy!"
    else
      flash.now.notice = "errors found"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end