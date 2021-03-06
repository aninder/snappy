class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionView::MissingTemplate,
              with: proc{
                           headers['X-NOT_ALLOWED']=request.headers['HTTP_ACCEPT']
                           render :nothing => true, :status => 404
                        }


  def current_user
    if session[:user]
      @current_user ||= User.find(session[:user])
    end
  end
  helper_method :current_user

  def setCurrentUser user
    @current_user = user
  end
  helper_method :setCurrentUser

  def start_user_session user
    session[:user] = user.id
  end

  def signed_in?
    !session[:user].blank?
  end
  helper_method :signed_in?

  # function_level_access_control
  def checkSignedIn
    if !signed_in?
      head 420
      false
    end
  end


  # before_action proc{sleep 1}
end
