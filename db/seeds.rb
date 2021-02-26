# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@chef1 = Chef.create(name: 'Tommy', id: 1)
@dish1 = Dish.create(name: 'Pizza', description: 'You might hate yourself after, but damn if it is not delicious', chef_id: 1)
@ingredient1 = Ingredient.create(name: 'Sauce', calories: 50)
@ingredient2 = Ingredient.create(name: 'Dough', calories: 200)
@ingredient3 = Ingredient.create(name: 'Cheese', calories: 100)
@ingredient4 = Ingredient.create(name: 'Pepperoni', calories: 150)
DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
DishIngredient.create(dish: @dish1, ingredient: @ingredient3)
DishIngredient.create(dish: @dish1, ingredient: @ingredient4)
