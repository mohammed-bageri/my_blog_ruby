# frozen_string_literal: true

# This is the model for posts.
class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :content, presence: true
end
