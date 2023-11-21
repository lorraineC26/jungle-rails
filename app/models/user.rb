class User < ApplicationRecord
  # provided by Rails and handles password encryption using bcrypt
  has_secure_password
  
  def self.authenticate_with_credentials(email= '', password= '') 
    return nil if email.blank? || password.blank?
    
    # Find the user by email
    # Performing a case-insensitive search after stripping leading and trailing whitespaces
    user = User.find_by('LOWER(email) = ?', email.downcase.strip)

    # Authenticate the user with the provided password
    # authenticate method is from has_secure_password
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end


  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  
end
