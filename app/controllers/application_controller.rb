class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :sign_in!

  def sign_in!
    github_authenticate!
    user = User.where(github_id: github_user.id.to_s, email: github_user.email).first_or_create!

    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id])
  end

  def signed_in?
    session[:user_id].present?
  end
end
