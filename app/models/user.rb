class User < ApplicationRecord
    has_secure_password

     
    validates :password, length: { minimum: 3 }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false}
    validates :password_confirmation, presence: true
 

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)
    user && user.authenticate(password) ? user : nil
  end

 
end