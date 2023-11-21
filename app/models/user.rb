class User < ApplicationRecord
  # provided by Rails and handles password encryption using bcrypt
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  
end
