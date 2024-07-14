# frozen_string_literal: true

# this is a serializer for the user model
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  attribute :avatar do |object|
    Rails.application.routes.url_helpers.rails_blob_path(object.avatar, only_path: true) if object.avatar&.attached?
  end
end
