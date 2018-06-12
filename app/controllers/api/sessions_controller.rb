class Api::SessionsController < ApplicationController
  before_action :require_sign_in!, only: [:destroy]
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

  # DELETE /api/sessions
  def destroy
    sign_out
    render text: "success", status: :ok
  end

  private
    def set_user
      @user = User.find_by!(email: session_params[:email])
    end

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
