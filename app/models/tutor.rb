class Tutor < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :comments,dependent: :destroy
  has_many :events, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }



  def to_label
    self.user.first_name

  end

end
