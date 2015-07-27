# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create!(name: "Example User",
               email: "example@leaguetable.test",
               password: "password",
               password_confirmation: "password",
               admin: true)

Player.create!(name: "Joe Bloggs",
               email: "joe.bloggs@leaguetable.test",
               password: "password",
               password_confirmation: "password")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@leaguetable.test"
  password = "password"
  Player.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
end
