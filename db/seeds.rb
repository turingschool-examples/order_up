# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IngredientsList.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all

@gusteau = Chef.create!(name: "Gusteau")

@soupy = @gusteau.dishes.create!(name: "Warm Soup", description: "I think it has potatoes and cream or something idk the rat messed it up")
@pbsquid = @gusteau.dishes.create!(name: "Squid Dressed with Peanut Butter", description: "It's so bad it's laughable")
@pbsoup = @gusteau.dishes.create!(name: "Peanut butter soup", description: "created for the purpose of testing that uniq ingredients show up")

@potato = Ingredient.create!(name: "Potato", calories: 10)
@cream = Ingredient.create!(name: "Heavy Whipping Cream", calories: 17)
@squid = Ingredient.create!(name: "A Whole Squid", calories: 103)
@pb = Ingredient.create!(name: "Smooth Peanut Butter", calories: 16)

IngredientsList.create!(dish_id: @soupy.id, ingredient_id: @potato.id)
IngredientsList.create!(dish_id: @soupy.id, ingredient_id: @cream.id)
IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @squid.id)
IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @pb.id)
IngredientsList.create!(dish_id: @pbsoup.id, ingredient_id: @pb.id)
IngredientsList.create!(dish_id: @pbsoup.id, ingredient_id: @cream.id)
