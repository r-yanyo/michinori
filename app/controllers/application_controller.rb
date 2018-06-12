class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    remember_token = User.encrypt(cookies[:user_remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  def sign_out
    @current_user = nil
  end
  
end
