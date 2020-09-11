# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef = Chef.create!(name: "Daniel")
dish = Dish.create!(name: "fruit bowl", description: "A bowl of fruit", chef_id: "#{chef.id}")
dish2 = Dish.create!(name: "Orangaid", description: "pureed oranges", chef_id: "#{chef.id}")
ingredient = Ingredient.create!(name: "Apple", calories: 50)
ingredient2 = Ingredient.create!(name: "Orange", calories: 70)
DishIngredient.create!(dish_id: "#{dish.id}", ingredient_id: "#{ingredient.id}")
DishIngredient.create!(dish_id: "#{dish.id}", ingredient_id: "#{ingredient2.id}")
DishIngredient.create!(dish_id: "#{dish2.id}", ingredient_id: "#{ingredient2.id}")
