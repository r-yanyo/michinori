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

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
