class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    password_authenticated = user&.authenticate(password) # this will return a boolean value
    # user&.authenticate(password) -- if the user is not there, don't run authenticate and return nil
    
    if user && password_authenticated
      return user
    else
      return nil
    end
  end
end
