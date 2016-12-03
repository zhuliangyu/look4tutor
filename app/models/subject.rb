class Subject < ActiveRecord::Base
  has_many :teaches, dependent: :destroy
  has_many :tutors, through: :teaches

end
