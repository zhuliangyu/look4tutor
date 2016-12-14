class TutorSerializer < ActiveModel::Serializer
  attributes :id
  attributes :url
  attributes :name
  attributes :cellphone
  attributes :priceRange
  attributes :picURL


  def name
    object.user.first_name + ' '+object.user.last_name
  end

  def url
    'http://localhost:3000/api/v1/tutors/'+ object.id.to_s

  end

  def priceRange
    "$#{object.low_price} - $#{object.high_price}"

  end

  def picURL
    object.image

  end

  has_many :comments
  has_many :events
end
