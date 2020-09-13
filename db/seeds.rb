# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef = Chef.create(name: "Chef")

    dish_1 = chef.dishes.create(name: "Dish 1", description: "Dish 1 description")
    dish_2 = chef.dishes.create(name: "Dish 2", description: "Dish 2 description")
    dish_3 = chef.dishes.create(name: "Dish 3", description: "Dish 3 description")
    dish_4 = chef.dishes.create(name: "Dish 4", description: "Dish 4 description")

    ingredient1 = Ingredient.create(name: "Ingredient 1", calories: 100)
    ingredient2 = Ingredient.create(name: "Ingredient 2", calories: 20)
    ingredient3 = Ingredient.create(name: "Ingredient 3", calories: 10)
    ingredient4 = Ingredient.create(name: "Ingredient 4", calories: 100)
    ingredient5 = Ingredient.create(name: "Ingredient 5", calories: 20)
    ingredient6 = Ingredient.create(name: "Ingredient 6", calories: 10)

    DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient1.id)
    DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient2.id)
    DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient3.id)
    DishIngredient.create(dish_id: dish_2.id, ingredient_id: ingredient4.id)
    DishIngredient.create(dish_id: dish_2.id, ingredient_id: ingredient5.id)
    DishIngredient.create(dish_id: dish_2.id, ingredient_id: ingredient6.id)
    DishIngredient.create(dish_id: dish_3.id, ingredient_id: ingredient1.id)
    DishIngredient.create(dish_id: dish_3.id, ingredient_id: ingredient2.id)
    DishIngredient.create(dish_id: dish_3.id, ingredient_id: ingredient3.id)
    DishIngredient.create(dish_id: dish_4.id, ingredient_id: ingredient1.id)
    DishIngredient.create(dish_id: dish_4.id, ingredient_id: ingredient2.id)
    DishIngredient.create(dish_id: dish_4.id, ingredient_id: ingredient3.id)