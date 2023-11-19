class User < ApplicationRecord
  # provided by Rails and handles password encryption using bcrypt
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
