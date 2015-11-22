class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    u = User.find_by_name params[:user][:name]
    if u.try(:authenticate, params[:user][:password])
      session[:user] = u.id
      redirect_to root_path, notice: "user authenticated"
    else
      redirect_to new_session_path, notice: "login not sucessfull, try again"
    end
  end

  def destroy
    session.delete :user
    redirect_to new_session_path, notice: "you are logged out!!"
  end

  private

  def user_params
    params.require(:user).permit(:name,:password)
  end
end