# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@chef_1 = Chef.create!(name: "Kris Litman")
@dish_1 = @chef_1.dishes.create!(name: "dank curry", description: "Southern style fish curry")
@dish_2 = @chef_1.dishes.create!(name: "pazole", description: "sabores de las mayas")
@corn = Ingredient.create(name: "corn", calories: 50)
@fish = Ingredient.create(name: "fish", calories: 100)
@broth = Ingredient.create(name: "Chicken broth", calories: 100)
@potato = Ingredient.create(name: "Potato", calories: 125)
@dish_1.ingredients << @fish
@dish_1.ingredients << @broth
@dish_1.ingredients << @potato
@dish_1.ingredients << @corn
