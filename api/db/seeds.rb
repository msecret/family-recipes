# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Image.destroy_all

Image.create!(
  name: 'Anita Ferroggiaro',
  url: 'anita.jpg',
  alt: 'Picture of Anita Ferroggiaro',
  width_orig: 960,
  height_orig: 960,
)

Image.create!(
  name: 'Paul Ferroggiaro',
  url: 'paul.jpg',
  alt: 'Picture of Paul Ferroggiaro',
  width_orig: 720,
  height_orig: 720,
)

Image.create!(
  name: 'Linda Lacampagne',
  url: 'linda.jpg',
  alt: 'Picture of Linda Lacampagne',
  width_orig: 960,
  height_orig: 960,
)

Image.create!(
  name: 'Nancy Segreto',
  url: 'nancy.jpg',
  alt: 'Picture of Nancy Segreto',
  width_orig: 180,
  height_orig: 177,
)

Image.create!(
  name: 'Joe Segreto',
  url: 'joe.jpg',
  alt: 'Picture of Joe Segreto',
  width_orig: 316,
  height_orig: 316,
)

Image.create!(
  name: 'Ali Segreto',
  url: 'ali.jpg',
  alt: 'Picture of Ali Segreto',
  width_orig: 334,
  height_orig: 508,
)

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

Category.destroy_all

Category.create(
  name: 'antipasti',
  display_name: 'Antipasti',
  order: 1
)

Category.create(
  name: 'primi',
  display_name: 'Primi',
  order: 2
)

Category.create(
  name: 'secondi',
  display_name: 'Secondi',
  order: 3
)

Category.create(
  name: 'contorni',
  display_name: 'Contorni',
  order: 4
)

Category.create(
  name: 'dolci',
  display_name: 'Dolci',
  order: 5
)

p "Created #{Category.count} categories"

Recipe.destroy_all

10.times do |i|
  Recipe.create(
    title: Faker::Name,
    difficulty: Faker::Number.between(1, 800),
    story: Faker::Lorem.sentence(1),
    ingredients: Faker::Food.ingredient,
    description: Faker::Lorem.sentence(3),
    category: Category.order('RANDOM()').first,
    image: Image.order('RANDOM()').first,
  )
end

p "Created #{Recipe.count} recipes"
