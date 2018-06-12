class Api::UsersController < ApplicationController
  # POST /api/users
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
