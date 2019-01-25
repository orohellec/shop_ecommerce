# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |i|
  Item.create!(
    title: Faker::RickAndMorty.character,
    description: Faker::RickAndMorty.quote,
    original_price: rand(5..80),
    image_url: Faker::Avatar.image("my-own-slug", "50x50"),
    has_discount: false,
    discount_percentage: 0
  )
  puts "Item #{i + 1} create"
end

3.times do |i|
  User.create!(
    first_name: Faker::DragonBall.character,
    last_name: Faker::Artist.name,
    email: "user#{i}@seed.com",
    password: "lalala",
    password_confirmation: "lalala"
  )
  puts "User #{i + 1} create"
end

2.times do |i|
  Admin.create!(
    email: "admin#{i}@seed.com",
    password: "lalala",
    password_confirmation: "lalala"
  )
  puts "Admin #{i + 1} create"
end
