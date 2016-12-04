class Region < ActiveRecord::Base
  has_many :tutors, dependent: :nullify
end
