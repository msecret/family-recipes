# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Image.destroy_all

15.times do
  Image.create!(
    name: Faker::Food.dish,
    url: Faker::Internet.url('family-recipes.com'),
    text: Faker::Food.measurement,
    width_orig: Faker::Number.between(1, 800),
    height_orig: Faker::Number.between(1, 800),
    alt: Faker::Food.ingredient
  )
end

10.times do
  Image.create!(
    name: Faker::Name,
    url: Faker::Internet.url('family-recipes.com'),
    text: Faker::Friends.quote,
    width_orig: Faker::Number.between(1, 800),
    height_orig: Faker::Number.between(1, 800),
    alt: Faker::StarWars.quote
  )
end

p "Created #{Image.count} images"


Cook.destroy_all

images = Image.last(10).reverse
10.times do |i|
  Cook.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    date_of_birth: Faker::Date.between(80.years.ago, Date.today),
    location: Faker::Address.city,
    image: images[i]
  )
end

p "Created #{Cook.count} cooks"
