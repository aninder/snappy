module ApplicationHelper
  def signed_in?
    !session[:user].blank?
  end
end
