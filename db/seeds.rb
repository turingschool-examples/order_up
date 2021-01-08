# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DishIngredient.destroy_all 
Dish.destroy_all
Chef.destroy_all
Ingredient.destroy_all

ramsey = Chef.create!(name: "Gordon Ramsey")
remy = Chef.create!(name: "Remy Gusteau")
linguini = Chef.create!(name: "Alfredo Linguini")

pizza = Dish.create!(name: "Supreme", description: "great food", chef_id: ramsey.id )
pbj = Dish.create!(name: "Peanutbutter and Jelly Sandwich", description: "simple and delicious", chef_id: remy.id)
blt = Dish.create!(name: "BLT Sandwich", description: "tasty and delicious", chef_id: remy.id)
tamales = Dish.create!(name: "Tamales", description: "Comes in various flavors", chef_id: linguini.id)

ingredient1 = Ingredient.create!(name: "tomato sauce", calories: 45)
ingredient2 = Ingredient.create!(name: "penut butter", calories: 60)
ingredient3 = Ingredient.create!(name: "chili sauce", calories: 10)
ingredient4 = Ingredient.create!(name: "dough" , calories: 75)
ingredient5 = Ingredient.create!(name: "bread" , calories: 27)

DishIngredient.create!(ingredient_id: ingredient1.id, dish_id: pizza.id)
DishIngredient.create!(ingredient_id: ingredient2.id, dish_id: pbj.id)
DishIngredient.create!(ingredient_id: ingredient3.id, dish_id: tamales.id)
DishIngredient.create!(ingredient_id: ingredient4.id, dish_id: tamales.id)
DishIngredient.create!(ingredient_id: ingredient5.id, dish_id: pbj.id)