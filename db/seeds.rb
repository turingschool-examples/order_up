# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef1 = Chef.create(name: "Gordon Ramsay")
@chef2 = Chef.create(name: "Bobby Flay")
@dish1 = @chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
@dish2 = @chef1.dishes.create(name: "Fish and Chips", description: "Oh yeah")
@dish3 = @chef2.dishes.create(name: "Steak Fillet", description: "juicy")
@dish4 = @chef2.dishes.create(name: "Fish Fillet", description: "smelly")
@ingredient1 = Ingredient.create(name: "Beef", calories: 100)
@ingredient2 = Ingredient.create(name: "Steak", calories: 200)
@ingredient3 = Ingredient.create(name: "Fish", calories: 50)
@ingredient4 = Ingredient.create(name: "Fries", calories: 350)
@ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
DishIngredient.create(dish: @dish2, ingredient: @ingredient3)
DishIngredient.create(dish: @dish2, ingredient: @ingredient4)
DishIngredient.create(dish: @dish3, ingredient: @ingredient2)
DishIngredient.create(dish: @dish4, ingredient: @ingredient3)
DishIngredient.create(dish: @dish3, ingredient: @ingredient4)
DishIngredient.create(dish: @dish1, ingredient: @ingredient5)
DishIngredient.create(dish: @dish4, ingredient: @ingredient5)