# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@bob = Chef.create!(name: "Bob")

@dish_1 = @bob.dishes.create!(name: "Dish 1", description: "particularly delicious")
@dish_2 = @bob.dishes.create!(name: "Dish 2", description: "xtra delicious")
@dish_3 = @bob.dishes.create!(name: "Dish 3", description: "massive delicious")

@ingredient_1 = Ingredient.create!(name: "A")
@ingredient_2 = Ingredient.create!(name: "B")
@ingredient_3 = Ingredient.create!(name: "C")
@ingredient_4 = Ingredient.create!(name: "D")

Recipe.create!(dish: @dish_1, ingredient: @ingredient_1)
Recipe.create!(dish: @dish_1, ingredient: @ingredient_2)
Recipe.create!(dish: @dish_1, ingredient: @ingredient_3)

Recipe.create!(dish: @dish_2, ingredient: @ingredient_1)
Recipe.create!(dish: @dish_2, ingredient: @ingredient_2)

Recipe.create!(dish: @dish_3, ingredient: @ingredient_1)
Recipe.create!(dish: @dish_3, ingredient: @ingredient_2)
Recipe.create!(dish: @dish_3, ingredient: @ingredient_3)
Recipe.create!(dish: @dish_3, ingredient: @ingredient_4)
