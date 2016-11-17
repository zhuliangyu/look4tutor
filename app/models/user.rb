class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :password_digest,presence: true

private
  def find_user_by_id(id)
    User.find_by(id:id)

  end


  end
