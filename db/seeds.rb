# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: "Bob")
@dish_1 = Dish.create!(name: "Pasta", description: 'Good dish', chef_id: @chef.id)
@dish_2 = Dish.create!(name: "Soup", description: 'Good soup', chef_id: @chef.id)

@ingredient_1 = @dish_1.ingredients.create!(name: 'onions', calories: 100)
@ingredient_2 = @dish_1.ingredients.create!(name: 'noodles', calories: 350)
@ingredient_3 = @dish_1.ingredients.create!(name: 'sauce', calories: 200)

@ingredient_4 = @dish_2.ingredients << @ingredient_1
@ingredient_5 = @dish_2.ingredients.create!(name: 'chicken stock', calories: 100)
@ingredient_6 = @dish_2.ingredients.create!(name: 'bell peppers', calories: 25)
