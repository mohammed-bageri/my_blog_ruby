# frozen_string_literal: true

module Error
  # A module to globally handle errors
  module ErrorHandler
    def self.included(obj) # rubocop:disable Metrics/MethodLength
      obj.class_eval do
        rescue_from ActiveRecord::RecordNotFound do |e|
          respond(:record_not_found, 404, e.to_s)
        end

        rescue_from StandardError do |e|
          respond(:standard_error, 500, e.to_s)
        end

        rescue_from CustomError do |e|
          respond(e.error, e.status, e.message.to_s)
        end
      end
    end

    private

    def respond(error, status, message)
      json = Helpers::Render.json(error, status, message)
      render json:
    end
  end
end
