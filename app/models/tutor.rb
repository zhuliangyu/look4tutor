class Tutor < ActiveRecord::Base
  include AASM


  belongs_to :user, required: true
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? and obj.address_changed? }


  has_many :teaches, dependent: :destroy
  has_many :subjects, through: :teaches

  def to_label
    self.user.first_name
  end


  aasm do
    state :draft, :initial => true
    state :published

    event :publish do
      transitions :from => :draft, :to => :published
    end

    event :unpublish do
      transitions :from => :published, :to => :draft
    end


  end


end
