class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :signed_in?
  def signed_in?
    current_user.present?
  end

end
