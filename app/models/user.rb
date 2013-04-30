class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :email, presence: true,
uniqueness: { case_sensitive: false }
end
