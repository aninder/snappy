module ApplicationHelper
  def signed_in?
    if session[:user].blank?
      false
    else
      true
    end
  end

  def current_user
    if session[:user]
      User.find_by_id(session[:user])
    end
  end
end
