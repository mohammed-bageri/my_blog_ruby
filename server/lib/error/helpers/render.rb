# frozen_string_literal: true

module Error
  module Helpers
    # Helper class for rendering errors in json
    class Render
      def self.json(error, status, message)
        {
          status:,
          error:,
          message:
        }.as_json
      end
    end
  end
end
