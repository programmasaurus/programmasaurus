class GithubAuthenticationsController < ApplicationController

  def create
    github_authenticate!
    redirect_to github_authentication_path
  end

  def show
    github_authenticate!
    user = User.where(github_id: github_user.id.to_s, email: github_user.email).first_or_create!
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    github_logout
    session[:user_id] = nil
    redirect_to root_path
  end

end
