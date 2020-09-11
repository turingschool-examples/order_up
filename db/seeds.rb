# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef_1 = Chef.create!(name: "Dan")
chef_2 = Chef.create!(name: "Babish")
dish_1 = chef_1.dishes.create!(name: "A Dish", description: "A Description")
dish_2 = chef_1.dishes.create!(name: "B Dish", description: "B Description")
dish_3 = chef_2.dishes.create!(name: "C Dish", description: "C Description")
ingredient_1 = Ingredient.create!(name: "A Ingredient", calories: 100)
ingredient_2 = Ingredient.create!(name: "B Ingredient", calories: 300)
ingredient_3 = Ingredient.create!(name: "C Ingredient", calories: 400)
ingredient_4 = Ingredient.create!(name: "D Ingredient", calories: 200)
DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
