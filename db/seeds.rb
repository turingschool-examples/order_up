# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef_1 = Chef.create!(name: "Emeril Lagasse")

dish_1 = Dish.create!(name: "Jalapeno Cornbread", description: "The cornbread has the perfect texture and the jalapenos add a great kick.")

corn = Ingredient.create!(name: "corn", calories: 132)
milk = Ingredient.create!(name: "milk", calories: 122)
jalapeno = Ingredient.create!(name: "jalapeno", calories: 4)
flour = Ingredient.create!(name: "flour", calories: 100)
