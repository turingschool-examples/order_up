# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Dish.destroy_all
DishIngredient.destroy_all
Ingredient.destroy_all

@chef = Chef.create!(name: "Gordon Ramsey")
@dish = Dish.create!(name: "Beef Wellington", description: "A delightful beef lightly coated", chef_id: @chef.id)


@beef = Ingredient.create!(name: 'beef tenderloin', calories: 125)
@flour = Ingredient.create!(name: 'flour', calories: 15)

DishIngredient.create!(dish: @dish, ingredient: @beef)
DishIngredient.create!(dish: @dish, ingredient: @flour)
