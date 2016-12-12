class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :password_digest, presence: true

  has_one :tutor, dependent: :destroy

  has_many :comments, dependent: :destroy

  acts_as_messageable


  def name
    self.first_name
  end

  def mailboxer_email(object)
    self.email
  end

  private
  def find_user_by_id(id)
    User.find_by(id: id)

  end




end
