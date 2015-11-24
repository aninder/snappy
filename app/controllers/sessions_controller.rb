class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    u = User.find_by_name user_params[:name]
    if u.try(:authenticate, user_params[:password])
      start_user_session u
      redirect_to root_path, notice: "user authenticated"
    else
      redirect_to new_session_path, notice: "login not sucessfull, try again"
    end
  end

  def destroy
    session.delete :user
    redirect_to root_path, notice: "you are logged out!!"
  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end
end