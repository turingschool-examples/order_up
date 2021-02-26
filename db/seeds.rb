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
@chef1 = Chef.create(name: "Chef Jen")
@dish1 = @chef1.dishes.create(name: "Fudge Cake", description: "Floating Chocolate")
@chocolate = Ingredient.create(name: "chocolate", calories: 50.00)
@fudge = Ingredient.create(name: "fudge", calories: 70.00)
DishIngredient.create(dish: @dish1, ingredient: @chocolate)
DishIngredient.create(dish: @dish1, ingredient: @fudge)

@chef2 = Chef.create(name: "Chef Khoa")
@dish2 = @chef2.dishes.create(name: "Durian Cake", description: "Durain Exquisite")
@durian = Ingredient.create(name: "durian", calories: 45.00)
@white_chocolate = Ingredient.create(name: "white chocolate", calories: 70.00)
DishIngredient.create(dish: @dish2, ingredient: @durian)
DishIngredient.create(dish: @dish2, ingredient: @white_chocolate)
