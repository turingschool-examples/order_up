# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef = Chef.create(name: "Ratatouille")
dish1 = chef.dishes.create(name: "Pasta", description: "Angel hair noodles")
dish2 = chef.dishes.create(name: "Garlic Bread", description: "French bread with garlic and butter")
ingredient1 = Ingredient.create(name: "Noodles", calories: 400)
ingredient2 = Ingredient.create(name: "Butter", calories: 100)
ingredient3 = Ingredient.create(name: "Bread", calories: 200)
ingredient4 = Ingredient.create(name: "Garlic", calories: 50)
IngredientsDish.create(ingredient_id: ingredient1.id, dish_id: dish1.id)
IngredientsDish.create(ingredient_id: ingredient2.id, dish_id: dish1.id)
IngredientsDish.create(ingredient_id: ingredient3.id, dish_id: dish2.id)
IngredientsDish.create(ingredient_id: ingredient4.id, dish_id: dish2.id)
