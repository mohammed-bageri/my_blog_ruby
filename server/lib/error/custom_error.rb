# frozen_string_literal: true

module Error
  # A Custom error class that hold common error attributes
  class CustomError < StandardError
    attr_reader :status, :error, :message

    def initialize(error = nil, status = nil, message = nil)
      super
      @error = error || 422
      @status = status || :unprocessable_entity
      @message = message || 'Something went wrong'
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end
