# frozen_string_literal: true

# This controller handles requests that are not matched by a route.
class ErrorsController < ApplicationController
  def not_found
    render json: {
      status: 404,
      error: :not_found,
      message: 'Resource not found'
    }, status: :not_found
  end

  def internal_server_error
    render json: {
      status: 500,
      error: :internal_server_error,
      message: 'Server is having a problem'
    }, status: :internal_server_error
  end
end
