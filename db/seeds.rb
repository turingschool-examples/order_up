# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all
DishIngredient.destroy_all

@chef1 = Chef.create!(name: "Peter")
@dish1 = @chef1.dishes.create!(name: "Mac n Cheese", description: "Delicious!, but high in calories")
@ingredient1 = @dish1.ingredients.create!(name: "Elbow Pasta", calories: 80)
@ingredient2 = @dish1.ingredients.create!(name: "Cheese", calories: 180)
@ingredient3 = @dish1.ingredients.create!(name: "Butter", calories: 150)

@chef2 = Chef.create!(name: "Tony")
@dish2 = @chef2.dishes.create!(name: "Cheese Pizza", description: "Best Pizza in town")
@ingredient4 = @dish2.ingredients.create!(name: "Dough", calories: 120)
@ingredient5 = @dish2.ingredients.create!(name: "Cheese", calories: 180)
@ingredient6 = @dish2.ingredients.create!(name: "Pizza Sauce", calories: 100)