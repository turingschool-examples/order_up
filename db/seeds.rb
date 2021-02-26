# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef = Chef.create!(name: "Big Sloppy Sal")
dish_1 = chef.dishes.create!(name: "Pizza", description: "Better than your mothers!")

sauce = Ingredient.create!(name: "tomatoe sauce", calories: 50)
cheese = Ingredient.create!(name: "cheese", calories: 150)
dough = Ingredient.create!(name: "pizza dough", calories: 100)

DishIngredient.create!(dish: dish_1, ingredient: sauce)
DishIngredient.create!(dish: dish_1, ingredient: cheese)
DishIngredient.create!(dish: dish_1, ingredient: dough)
