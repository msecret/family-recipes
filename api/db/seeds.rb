# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Image.destroy_all

15.times do
  Image.create(
    name: Faker::Food.dish,
    url: Faker::Internet.url('family-recipes.com'),
    text: Faker::Food.measurement,
    width_orig: Faker::Number.between(1, 800),
    height_orig: Faker::Number.between(1, 800),
    alt: Faker::Food.ingredient
  )
end

p "Created #{Image.count} images"
