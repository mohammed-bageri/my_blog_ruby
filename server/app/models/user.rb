class User < ApplicationRecord
  has_secure_password
  enum :role, [ :regular, :admin ], default: :regular, validate: true
  validates :name, presence: true
  validates :email, uniqueness: true

end
