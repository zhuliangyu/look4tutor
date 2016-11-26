# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all

10.times do
User.create(first_name:"asd",
            last_name:"das",
            email: SecureRandom.uuid.to_s+'@abc.com',
            password:'123456'
)
end
puts 'successfully create user record'


10.times do
Tutor.create(
    degree:"asdasd",
    low_price:12,
    high_price:13,
    cellphone:'asdasdasd',
    user:User.all.sample

)
end
puts 'successfully create Tutor record'


AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')