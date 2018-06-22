class Api::SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  
  # POST /api/sessions
  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create_oauth
    @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    cookies[:user_id] = @user.id
    cookies[:token] = @user.remember_token
    redirect_to "/mypage"
  end

  # DELETE /api/sessions
  def destroy
    render plain: "success", status: :ok
  end

  private
    def set_user
      @user = User.find_by!(email: session_params[:email])
    end

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
