# frozen_string_literal: true

# This is for sign up
class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)

    render json: {
      user: UserSerializer.new(user).serializable_hash[:data][:attributes],
      token: @token
    }, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end
end
