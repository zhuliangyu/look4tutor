class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :password_digest,presence: true


end
