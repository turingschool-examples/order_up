# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
jon = Chef.create!(name: "Jon Favreau")
gordon = Chef.create!(name: "Gordon Ramsey")

fish = jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
cuban = jon.dishes.create!(name: "Cuban Sandwich", description: "My specialty")
tacos = jon.dishes.create!(name: "Street Tacos", description: "A taste of mexico")

burger = gordon.dishes.create!(name: "Ultimate Burger", description: "Best burger ever")
wellington = gordon.dishes.create!(name: "Beef Wellington", description: "My favorite meal to make")
f_chips = gordon.dishes.create!(name: "Fish and Chips", description: "A taste of my home")

salmon = Ingredient.create!(name: "Salmon", calories: 250)
cod = Ingredient.create!(name: "Cod", calories: 175)
bread = Ingredient.create!(name: "Bread", calories: 300)
steak = Ingredient.create!(name: "Steak", calories: 600)
guac = Ingredient.create!(name: "Guac", calories: 75)
potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
tortillas = Ingredient.create!(name: "Tortillas", calories: 200)
beef = Ingredient.create!(name: "Beef", calories: 250)
pork = Ingredient.create!(name: "Pork", calories: 225)
pastry = Ingredient.create!(name: "Pastry Dough", calories: 330)

DishIngredient.create!(dish: fish, ingredient: salmon)
DishIngredient.create!(dish: fish, ingredient: potatoes)
DishIngredient.create!(dish: f_chips, ingredient: cod)
DishIngredient.create!(dish: f_chips, ingredient: potatoes)
DishIngredient.create!(dish: cuban, ingredient: bread)
DishIngredient.create!(dish: cuban, ingredient: pork)
DishIngredient.create!(dish: tacos, ingredient: tortillas)
DishIngredient.create!(dish: tacos, ingredient: steak)
DishIngredient.create!(dish: tacos, ingredient: guac)
DishIngredient.create!(dish: burger, ingredient: beef)
DishIngredient.create!(dish: burger, ingredient: bread)
DishIngredient.create!(dish: wellington, ingredient: beef)
DishIngredient.create!(dish: wellington, ingredient: pastry)
