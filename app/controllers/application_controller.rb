class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :require_user!

  helper_method :current_user
  def current_user
    @current_user ||= User.where(github_id: github_user.id.to_s, email: github_user.email).first_or_create
  end

  helper_method :signed_in?
  def signed_in?
    github_user.present?
  end

  def require_user!
    unless signed_in?
      session[:return_url] = request.url
      flash[:notice] = "You must sign in to continue."
      redirect_to new_github_authentication_path
    end
  end
end
