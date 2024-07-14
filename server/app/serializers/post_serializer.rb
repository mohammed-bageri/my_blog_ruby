# frozen_string_literal: true

# this is a serializer for the post model
class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :published_at

  # attribute :author
  attribute :content do |object|
    object.content.body.to_trix_html if object.content?
  end
end
