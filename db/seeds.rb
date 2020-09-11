# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: 'Phil')

@dish = @chef.dishes.create!(name: 'Grilled Cheese', description: 'Gooey cheese bread')

@ingredient_1 = Ingredient.create!(name: "Slice Smoked Cheddar", calories: 150)
@ingredient_2 = Ingredient.create!(name: "2 Slices Sourdough Bread", calories: 200)
@ingredient_3 = Ingredient.create!(name: "Tbs Butter", calories: 100)

@dish_ingredient_1 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_1)
@dish_ingredient_2 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_2)
@dish_ingredient_3 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_3)
