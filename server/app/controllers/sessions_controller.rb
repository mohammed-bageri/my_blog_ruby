# frozen_string_literal: true

# This is for login and logout
class SessionsController < ApplicationController
  before_action :authorized, only: [:show]

  def create
    @user = User.find_by!(email: login_params[:email])
    if @user.authenticate(login_params[:password])
      @token = encode_token(user_id: @user.id)
      render json: {
        user: UserSerializer.new(@user).serializable_hash[:data][:attributes],
        token: @token
      }, status: :accepted
    else
      render json: { message: 'Incorrect password' }, status: :unauthorized
    end
  end

  def show
    render json: current_user, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
