require 'faker'

User.destroy_all
Item.destroy_all

6.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now
  )
end
users = User.all

30.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end

admin = User.create!(
  email: 'admin@example.com',
  password: 'helloworld',
  confirmed_at: Time.now
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
