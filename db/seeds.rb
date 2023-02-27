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
    bio: Faker::Company.catch_phrase
  )
end

users = User.all
puts("Seeded #{users.count} users!")

users.each do |user|
  Post.create!(
    [
      {
        user_id: user.id,
        title: Faker::Job.field,
        content: Faker::Hacker.say_something_smart
      },
      {
        user_id: user.id,
        title: Faker::Job.field,
        content: Faker::Hacker.say_something_smart
      }
    ]
  )
end

puts("Seeded #{Post.all.count} posts!")
