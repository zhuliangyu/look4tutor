class Tutor < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :comments,dependent: :destroy
  has_many :events, dependent: :destroy


  def to_label
    self.user.first_name

  end

end
