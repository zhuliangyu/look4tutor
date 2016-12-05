class Tutor < ActiveRecord::Base
  include AASM


  belongs_to :user, required: true
  # belongs_to :user

  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  belongs_to :region


  geocoded_by :geoAddress
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  # geocoded_by :address
  # after_validation :geocode


  def geoAddress

    self.address + "," +self.region.name

  end


  has_many :teaches, dependent: :destroy
  has_many :subjects, through: :teaches

  #for pagination config
  self.per_page = 10


  def to_label
    self.user.first_name
  end

  def short_description
    length=self.description.length
    if length<=50
      self.description
    else
      self.description[0,350]+"..."
    end

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
