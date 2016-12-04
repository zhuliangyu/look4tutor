class Subject < ActiveRecord::Base
  has_many :teaches, dependent: :destroy
  has_many :tutors, through: :teaches

  def to_label
    "#{course}"
  end
end

