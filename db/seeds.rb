

# rake db:drop db:create db:migrate db:seed


User.all.destroy_all
10.times do
  User.create(first_name: "asd",
              last_name: "das",
              email: SecureRandom.uuid.to_s+'@abc.com',
              password: '123456'
  )
end
puts 'successfully create user record'

Region.all.destroy_all
Region.create(name: "Richmond,British Columbia")
Region.create(name: "Surrey,British Columbia")
Region.create(name: "Vancouver,British Columbia")
Region.create(name: "Burnaby,British Columbia")
Region.create(name: "Coquitlam,British Columbia")
Region.create(name: "Langley,British Columbia")
puts 'successfully create Region record'

Subject.all.destroy_all
Subject.create(course: "Business")
Subject.create(course: "Accounting")
Subject.create(course: "Math")
Subject.create(course: "Computer Science")
Subject.create(course: "Physics")
puts 'successfully create Subject record'

# Tutor.all.destroy_all
100.times do
  Tutor.create(
      degree: "asdasd",
      low_price: 12,
      high_price: 13,
      cellphone: '7783007912',
      user: User.all.sample,
      region: Region.all.sample,
      description:"I am a good teacher",
      subjects: Subject.all.sample(2)

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
