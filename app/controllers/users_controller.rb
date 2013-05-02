class UsersController < ApplicationController
  def show
    user_id = params[:id] || current_user.id
    @user = User.find(user_id)
  end
end
