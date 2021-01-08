# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

boyardee = Chef.create!(name: 'le chef')
meatball = Dish.create!(name: 'Meatball', description: 'Thats a soo spicy', chef_id: boyardee.id)
hero = meatball = Dish.create!(name: 'Hero', description: 'We dont all wear capes', chef_id: boyardee.id)
beef = Ingredient.create!(name: 'beef', calories: 350)
bread = Ingredient.create!(name: 'bread', calories: 100)
sauce = Ingredient.create!(name: 'tomato paste', calories: 50)
lettuce = Ingredient.create!(name: 'crispy lettuce', calories: 30)

DishIngredient.create!(dish_id: meatball.id, ingredient_id: beef.id)
DishIngredient.create!(dish_id: meatball.id, ingredient_id: bread.id)
DishIngredient.create!(dish_id: meatball.id, ingredient_id: sauce.id)
DishIngredient.create!(dish_id: hero.id, ingredient_id: beef.id)
DishIngredient.create!(dish_id: hero.id, ingredient_id: bread.id)
DishIngredient.create!(dish_id: hero.id, ingredient_id: lettuce.id)
