class GithubAuthenticationsController < ApplicationController
  def new
    github_authenticate!
    redirect_to github_authentication_path
  end

  def show
    github_authenticate!
    user = User.where(github_id: github_user.id.to_s, email: github_user.email).first_or_create!
    redirect_to session[:return_url] || root_path
  end

  def destroy
    github_logout
    redirect_to root_path
  end
end
