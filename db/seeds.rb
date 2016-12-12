

# rake db:drop db:create db:migrate db:seed


# User.all.destroy_all
100.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: SecureRandom.uuid.to_s+'@abc.com',
              password: '123456'
  )
end
puts 'successfully create user record'

# Region.all.destroy_all
Region.create(name: "Richmond,British Columbia")
Region.create(name: "Surrey,British Columbia")
Region.create(name: "Vancouver,British Columbia")
Region.create(name: "Burnaby,British Columbia")
Region.create(name: "Coquitlam,British Columbia")
Region.create(name: "Langley,British Columbia")
puts 'successfully create Region record'

# Subject.all.destroy_all
Subject.create(course: "English")
Subject.create(course: "Economics")
Subject.create(course: "Accounting")
Subject.create(course: "Math")
Subject.create(course: "Computer Science")
Subject.create(course: "Physics")


puts 'successfully create Subject record'

region_arr=[
    "Richmond,British Columbia",
    "Surrey,British Columbia",
    "Vancouver,British Columbia",
    "Burnaby,British Columbia",
    "Coquitlam,British Columbia",
    "Langley,British Columbia"
]

# Tutor.all.destroy_all
50.times do
  Tutor.create(
      degree: Faker::University.name,
      low_price: 12,
      high_price: 23,
      cellphone: Faker::PhoneNumber.cell_phone,
      user: User.all.sample,
      region: Region.all.sample,
      description:Faker::Lorem.paragraph(8),
      subjects: Subject.all.sample(2),
      address:region_arr.sample(1)


  )
end
puts 'successfully create Tutor record'


AdminUser.all.destroy_all
AdminUser.create!(email: 'zhuliangyu@gmail.com', password: '123456', password_confirmation: '123456')
puts 'successfully create Admin record'






# 10.times do
#   Teach.create(tutor: Tutor.all.sample, subject: Subject.all.sample)
# end
# puts 'successfully create Teach record'
