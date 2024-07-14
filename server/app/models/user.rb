# frozen_string_literal: true

# This is user model
class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts, dependent: :destroy, inverse_of: :author

  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true
  enum :role, %i[regular admin], default: :regular, validate: true
end
