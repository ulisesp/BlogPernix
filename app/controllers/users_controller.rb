class UsersController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash[:info][:email]
    user = User.find_or_create_by_email(email)
    session[:user_id] = user.id
    redirect_to root_path
  end
end