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

nino = Cook.create(
  first_name: "Nino",
  last_name: "Segreto",
  email: "",
  date_of_birth: Faker::Date.between(80.years.ago, Date.today),
  location: 'Phoenix',
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


# Recipes
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
bread = Ingredient.create(
  name: 'bread'
)
oliveoil = Ingredient.create(
  name: 'olive oil'
)
pepper = Ingredient.create(
  name: 'pepper'
)
garlic = Ingredient.create(
  name: 'garlic'
)
eggplant = Ingredient.create(
  name: 'eggplant'
)
celery = Ingredient.create(
  name: 'celery'
)
onion = Ingredient.create(
  name: 'onion'
)
vinegar = Ingredient.create(
  name: 'red wine vinegar'
)
sugar = Ingredient.create(
  name: 'sugar'
)
green_olive = Ingredient.create(
  name: 'green olive'
)
tomato_paste = Ingredient.create(
  name: 'tomato paste'
)
caper = Ingredient.create(
  name: 'caper'
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


https://s3-us-west-1.amazonaws.com/family-recipes/DSC02357.jpg
ibruschetta = Image.create(
  name: 'Bruschetta',
  url: ' https://s3-us-west-1.amazonaws.com/family-recipes/gnocchi-main.jpg',
  alt: 'Bruschetta plate with tomatoes',
  width: 1329,
  height: 888,
  width_orig: 1329,
  height_orig: 888,
)
rbruschetta = Recipe.create(
  title: 'Bruschetta',
  difficulty: 2,
  memorandums: '',
  story: "David would make this simple dish while getting ready to go out in Torino",
  description: "<p>The best type of bread for this recipe is unsalted Tuscan bread or homemade bread. Baugette French works well. Pre-sliced or packaged bread will not do. Toast the bread in the oven until brown and crisp. Rub at once with crushed garlic, brush lightly with olive oil and sprinkle generously with salt and freshly ground pepper.</p><p>Variations: top with freshly chopped tomatoes and basil or top with chicken livers.</p>",
  cooks: [david],
  category: antipasti,
  image: ibruschetta,
)
IngredientAmount.create(
  amount: '12',
  unit: 'slice',
  ingredient: bread,
  recipe: rbruschetta
)
IngredientAmount.create(
  amount: '2',
  unit: 'clove',
  ingredient: bread,
  recipe: rbruschetta
)
IngredientAmount.create(
  amount: 'some',
  unit: '',
  ingredient: oliveoil,
  recipe: rbruschetta
)
IngredientAmount.create(
  amount: '1',
  unit: 'pinch',
  ingredient: salt,
  recipe: rbruschetta
)
IngredientAmount.create(
  amount: '1',
  unit: 'pinch',
  ingredient: pepper,
  recipe: rbruschetta
)

caponata = Recipe.create(
  title: 'Caponata',
  difficulty: 3,
  memorandums: '',
  story: "David would make this simple dish while getting ready to go out in Torino",
  description: "<p>Wash the eggplants and dice them without peeling. Sprinkle with salt and leave in a colander for about 1 hour to drain off bitter juices. Wipe dry with paper towel. Deep-fry in hot oil until brown and drain on paper towels.</p><p>Clean the celery, discarding any coarse stalks. Cut the remaining stalks into short lengths and wash them under running water. Wipe dry and deep fry in  the same oil until golden brown.</p><p>Take 1 cup of the oil, pour it into another medium-sized pan and sauté the
onion until it changes color. Dilute the tomato paste with a little warm water.
Stir this into the onion, season with salt and cook for 15 minutes over a
moderate heat. Stir in the sugar, vinegar, capers, olives, eggplants and celery.
Sprinkle with plenty of freshly ground pepper, add salt if necessary, and
simmer for 10 minutes. Serve cold.</p>",
  cooks: [nino],
  category: antipasti,
)
IngredientAmount.create(
  amount: '2 1/2',
  unit: 'lbs',
  ingredient: eggplant,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1',
  unit: 'pinch',
  ingredient: salt,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1',
  unit: 'pinch',
  ingredient: pepper,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1',
  unit: 'tbs',
  ingredient: oliveoil,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1',
  unit: 'bunch',
  ingredient: celery,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1',
  unit: '',
  ingredient: onion,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1 1/4',
  unit: 'cup',
  ingredient: vinegar,
  recipe: caponata
)
IngredientAmount.create(
  amount: '4',
  unit: 'tsp',
  ingredient: sugar,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1/2',
  unit: 'cup',
  ingredient: green_olive,
  recipe: caponata
)
IngredientAmount.create(
  amount: '1',
  unit: 'small can',
  ingredient: tomato_paste,
  recipe: caponata
)
IngredientAmount.create(
  amount: '2',
  unit: 'tbl',
  ingredient: caper,
  recipe: caponata
)

p "Created #{Category.count} categories"
p "Created #{Image.count} images"
p "Created #{Cook.count} cooks"
p "Created #{Ingredient.count} ingredients"
p "Created #{Recipe.count} recipes"
