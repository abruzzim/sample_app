class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  validates :name,  presence: true, 
                    length:   { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true, 
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  
  # Add Rails 4 secure password method.
  # https://github.com/rails/rails/blob/master/activemodel/lib/active_model/secure_password.rb
  # http://api.rubyonrails.org/v4.0.0/classes/ActiveModel/Validations/HelperMethods.html#method-i-validates_confirmation_of
  has_secure_password

end
