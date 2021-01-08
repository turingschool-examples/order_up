# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef1 = Chef.create(name: "Chef Von Winkle")
@dish1 = Dish.create(name: "apple pie", description: "see name", chef: @chef1)
@dish2 = Dish.create(name: "pommes frites", description: "its delicious just eat it", chef: @chef1)
@ingredient1 = Ingredient.create(name: "pommes", calories: 300)
@ingredient2 = Ingredient.create(name: "frites", calories: 200)
@recipe1 = Recipe.create(dish: @dish2, ingredient: @ingredient1)
@recipe2 = Recipe.create(dish: @dish2, ingredient: @ingredient2)