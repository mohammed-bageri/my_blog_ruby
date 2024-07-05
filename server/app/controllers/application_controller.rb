class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key)
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
        token = header.split(" ")[1]
        begin
            JWT.decode(token, Rails.application.credentials.jwt_secret_key)
        rescue JWT::DecodeError
            nil
        end
    end
  end

end
