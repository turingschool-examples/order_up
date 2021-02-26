# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@chef = Chef.create(name: 'Chef 1')
@dish1 = @chef.dishes.create(name: 'Dish 1', description: 'dish description')
@dish2 = @chef.dishes.create(name: 'Dish 2', description: 'dish2 description')
@ingredient1 = Ingredient.create(name: 'Chicken', calories: 100)
@ingredient2 = Ingredient.create(name: 'Rice', calories: 200)
@ingredient3 = Ingredient.create(name: 'Beef', calories: 150)
@dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
@dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
@dish_ingredient3 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
