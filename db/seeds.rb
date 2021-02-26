# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: "Gordan Ramsey")
@dish_1 = @chef.dishes.create!(name: "Burrito", description: "A simple bean and cheese burrito")
@tortilla = Ingredient.create!(name: "Tortilla", calories: 200)
@beans = Ingredient.create!(name: "Pinto Beans", calories: 150)
@cheese = Ingredient.create!(name: "Sharp Chedder", calories: 175)
DishIngredient.create!(dish: @dish_1, ingredient: @tortilla)
DishIngredient.create!(dish: @dish_1, ingredient: @beans)
DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
