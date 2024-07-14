# frozen_string_literal: true

# This class represents the base controller for your Rails API application.
class ApplicationController < ActionController::API
  # include Error::ErrorHandler

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key)
  end

  def decoded_token
    header = request.headers['Authorization']
    return unless header

    token = header.split(' ')[1]
    begin
      JWT.decode(token, Rails.application.credentials.jwt_secret_key)
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def authorized
    return unless current_user.nil?

    render json: { message: 'Please log in' }, status: :unauthorized
  end

  def admin
    return if current_user.admin?

    render json: { message: 'You are not admin' }, status: :unauthorized
  end
end
