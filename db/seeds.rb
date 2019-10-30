require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

generated_password = Devise.friendly_token.first(8)


Role.create!(
  name: "parent"
)

Role.create!(
  name: "sitter"
)

for i in 1..10
  User.create!(
    email: Faker::Internet.email,
    password: "12345678",
    role_id: 2,
  )
  puts "Created #{i} user"
end


# for i in 1..10
#   Sitter.create(
#     name: Faker::Name.name,
#     description: Faker::Quote.famous_last_words,
#     age: Faker::Date.between(from: 200.days.ago, to: Date.today),
#     location: Faker::Address.city,
#     user_id: 1
#   )
#   puts "Created #{i} sitters"
# end

