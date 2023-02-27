# frozen_string_literal: true

num = 10

puts('Seeding data...')

User.destroy_all

num.times do
  User.create!(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password: Faker::Internet.password,
    avatar: Faker::Avatar.image,
    profession: Faker::Job.title,
    bio: Faker::Company.catch_phrase
  )
end

users = User.all
puts("Seeded #{users.count} users!")
