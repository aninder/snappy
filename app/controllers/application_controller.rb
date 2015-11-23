class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:user]
      User.find_by_id(session[:user])
    end
  end
  helper_method :current_user

  def start_user_session user
    session[:user] = user.id
  end

  def signed_in?
    !session[:user].blank?
  end
  helper_method :signed_in?
end
