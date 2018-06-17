# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Image.destroy_all

ianita = Image.create!(
  name: 'Anita Ferroggiaro',
  url: 'anita.jpg',
  alt: 'Picture of Anita Ferroggiaro',
  width: 960,
  height: 960,
  width_orig: 960,
  height_orig: 960,
)

ipaul = Image.create!(
  name: 'Paul Ferroggiaro',
  url: 'paul.jpg',
  alt: 'Picture of Paul Ferroggiaro',
  width: 720,
  height: 720,
  width_orig: 720,
  height_orig: 720,
)

ilinda = Image.create!(
  name: 'Linda Lacampagne',
  url: 'linda.jpg',
  alt: 'Picture of Linda Lacampagne',
  width: 960,
  height: 960,
  width_orig: 960,
  height_orig: 960,
)

inancy = Image.create!(
  name: 'Nancy Segreto',
  url: 'nancy.jpg',
  alt: 'Picture of Nancy Segreto',
  width: 180,
  height: 177,
  width_orig: 180,
  height_orig: 177,
)

ijoe = Image.create!(
  name: 'Joe Segreto',
  url: 'joe.jpg',
  alt: 'Picture of Joe Segreto',
  width: 316,
  height: 316,
  width_orig: 316,
  height_orig: 316,
)

iali = Image.create!(
  name: 'Ali Segreto',
  url: 'ali.jpg',
  alt: 'Picture of Ali Segreto',
  width: 334,
  height: 508,
  width_orig: 334,
  height_orig: 508,
)



Cook.destroy_all

linda = Cook.create(
  first_name: "Linda",
  last_name: "Lacampagne",
  email: "linda@aol.com",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Milbrae',
  image: ilinda
)

paull = Cook.create(
  first_name: "Paul",
  last_name: "Lacampagne",
  email: "linda@aol.com",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Milbrae',
  image: ilinda
)

joe = Cook.create(
  first_name: "Joe",
  last_name: "Segreto",
  email: "",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Greenbrae',
  image: ijoe
)

paul = Cook.create(
  first_name: "Paul",
  last_name: "Ferroggiaro",
  email: "",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Arroyo Grande',
  image: ipaul
)

anita = Cook.create(
  first_name: "Anita",
  last_name: "Ferroggiaro",
  email: "",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Daly City',
  image: ianita
)

nancy = Cook.create(
  first_name: "Nancy",
  last_name: "Segreto",
  email: "",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Greenbrae',
  image: inancy
)

ali = Cook.create(
  first_name: "Ali",
  last_name: "Segreto",
  email: "",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'San Francisco',
  image: iali
)


Category.destroy_all

antipasti = Category.create(
  name: 'antipasti',
  display_name: 'Antipasti',
  order: 1,
  icon_name: 'antipasti'
)

primi = Category.create(
  name: 'primi',
  display_name: 'Primi',
  icon_name: 'primi',
  order: 2
)

secondi = Category.create(
  name: 'secondi',
  display_name: 'Secondi',
  icon_name: 'secondi',
  order: 3
)

contorni = Category.create(
  name: 'contorni',
  display_name: 'Contorni',
  icon_name: 'contorni',
  order: 4
)

dolci = Category.create(
  name: 'dolci',
  display_name: 'Dolci',
  icon_name: 'dolci',
  order: 5
)


Recipe.destroy_all

salt = Ingredient.create(
  name: 'salt'
)
grated_cheese = Ingredient.create(
  name: 'grated cheese'
)
farina = Ingredient.create(
  name: 'farina de castgne'
)
flour = Ingredient.create(
  name: 'flour'
)
egg = Ingredient.create(
  name: 'egg'
)

egg_yolk = Ingredient.create(
  name: 'egg yolk'
)
butter = Ingredient.create(
  name: 'butter'
)
potato = Ingredient.create(
  name: 'potato',
  extra: 'old potatoes work best'
)
ignocchi = Image.create(
  name: 'Gnocchi',
  url: ' https://s3-us-west-1.amazonaws.com/family-recipes/gnocchi-main.jpg',
  alt: 'Gnocchi de castgne with pesto',
  width: 1184,
  height: 888,
  width_orig: 1184,
  height_orig: 888,
)
rgnocchi = Recipe.create(
  title: 'Gnocchi de Castagne',
  difficulty: 4,
  memorandums: 'In honor of Mary Cirelli',
  story: "This is our family’s all time favorite way to eat gnocchi. Both grandmotherswere experts at preparing these. As a child, I remember the bags of chestnutflour arriving from our cousins in Italy. These are always served with pestosauce. To splurge, I add cream cheese to the pesto and use freshly grated Parmesan cheese!",
  description: "<p>Cook and mash potatoes. Put them through a wire strainer. Add butter, setaside and cool. Add egg and egg yolk, flour, grated cheese and salt. Kneaduntil smooth and manageable, adding a little more flour if needed.</p><p>Roll dough into long, ropelike strips and cut into 3/4 in pieces. Use the tines of a fork (backside) to roll the gnocchi and make the indentations. The gnocchi should resemble a shell. Store on a floured board until ready to cook.</p><p>Boil in rapidly boiling salted water. When gnocchi come to the top. Removethem from the pot. Drain and serve with your favorite sauce and grated cheese. *** Prepare instant mashed potatoes to make 6-8 servings according to the package instructions. Use no other seasonings.</p><p>Use 3/4-cup flour and 3/4-cup castagne flour, 1 tsp. olive oil and 2 eggs, lightly beaten. When rolling the gnocchi, you will need extra flour – be sureto add white flour so that the castagne flavor is not too strong. Complete gnocchi as directed above.</p>",
  cooks: [linda],
  category: primi,
  image: ignocchi,
)
IngredientAmount.create(
  amount: '1/4',
  unit: 'tsp',
  ingredient: salt,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '1/4',
  unit: 'cup',
  ingredient: grated_cheese,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '1',
  unit: 'cup',
  ingredient: farina,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '1',
  unit: 'cup',
  ingredient: flour,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '1',
  unit: '',
  ingredient: egg_yolk,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '1',
  unit: '',
  ingredient: egg,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '1/4',
  unit: 'cube',
  ingredient: butter,
  recipe: rgnocchi
)
IngredientAmount.create(
  amount: '2',
  unit: 'lb',
  ingredient: potato,
  recipe: rgnocchi
)

p "Created #{Category.count} categories"
p "Created #{Image.count} images"
p "Created #{Cook.count} cooks"
p "Created #{Recipe.count} recipes"
