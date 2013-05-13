class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, presence: true,
uniqueness: { case_sensitive: false }

  private
  #the method to create a unique token to be remembered for users to see his/her account without log in every time
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
