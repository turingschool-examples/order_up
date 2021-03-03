# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef = Chef.create!(name: "Bourdain")

dish1 = Dish.create!(name: "Pasta", description: "Chicken Alfredo", chef_id: chef.id)
dish2 = Dish.create!(name: "Salad", description: "Chicken Salad", chef_id: chef.id)

ingredient1 = Ingredient.create!(name: "Fettucine", calories: 200)
ingredient2 = Ingredient.create!(name: "Chicken", calories: 250)
ingredient3 = Ingredient.create!(name: "Alfredo", calories: 350)
ingredient4 = Ingredient.create!(name: "Lettuce", calories: 100)
ingredient5 = Ingredient.create!(name: "Crouton", calories: 150)

dish_ing1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
dish_ing2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)
dish_ing3 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient3.id)
dish_ing4 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient4.id)
dish_ing5 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient5.id)
dish_ing6 = DishIngredient.create!(dish_id: dish2.id, ingredient_id: ingredient2.id)