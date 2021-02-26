# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DishIngredient.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all


chef_a = Chef.create!(name: "Assa Paragus")
chef_b = Chef.create!(name: "Bolo Gnaze")
chef_c = Chef.create!(name: "Crew D'Itay")

dish_1 = chef_a.dishes.create!(name: "Asparagus Stirfy", description: "Sizzly!")
dish_2 = chef_a.dishes.create!(name: "Grilled Asparagus", description: "Crunchy!")
dish_3 = chef_a.dishes.create!(name: "Cream of Asparagus Soup", description: "Creamy!")
dish_4 = chef_b.dishes.create!(name: "Penne ala Meat Sauz", description: "Saucey!")
dish_5 = chef_b.dishes.create!(name: "Meat Lovers Chili", description: "Savory!")
dish_6 = chef_b.dishes.create!(name: "Steak and Meat Sauz", description: "Meaty!")
dish_7 = chef_c.dishes.create!(name: "Hummus", description: "Smooth")
dish_8 = chef_c.dishes.create!(name: "Salsa", description: "Spicey!")
dish_9 = chef_c.dishes.create!(name: "Gaucamole", description: "Fresh!")

asparagus = Ingredient.create!(name: "Asparagus")
snap_peas = Ingredient.create!(name: "Snap Peas")
noodles = Ingredient.create!(name: "Noodles")
beef = Ingredient.create!(name: "Beef")

chef_a.dishes.find(dish_1.id).ingredients << asparagus
chef_a.dishes.find(dish_1.id).ingredients << snap_peas
chef_a.dishes.find(dish_1.id).ingredients << noodles
chef_a.dishes.find(dish_2.id).ingredients << asparagus
chef_a.dishes.find(dish_2.id).ingredients << beef
chef_a.dishes.find(dish_3.id).ingredients << asparagus


chef_b.dishes.find(dish_4.id).ingredients << beef
chef_b.dishes.find(dish_4.id).ingredients << noodles
chef_b.dishes.find(dish_5.id).ingredients << beef
chef_b.dishes.find(dish_6.id).ingredients << beef
chef_b.dishes.find(dish_6.id).ingredients << asparagus
