# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# DishIngredient.destroy_all
# Indredient.destroy_all
Dish.destroy_all
Chef.destroy_all


chef_a = Chef.create!(name: "Assa Paragus")
chef_b = Chef.create!(name: "Bolo Gnaze")
chef_c = Chef.create!(name: "Crew D'Itay")

chef_a.dishes.create!(name: "Asparagus Stirfy", description: "Sizzly!")
chef_a.dishes.create!(name: "Grilled Asparagus", description: "Crunchy!")
chef_a.dishes.create!(name: "Cream of Asparagus Soup", description: "Creamy!")
chef_b.dishes.create!(name: "Penne ala Meat Sauz", description: "Saucey!")
chef_b.dishes.create!(name: "Meat Lovers Chili", description: "Savory!")
chef_b.dishes.create!(name: "Steak and Meat Sauz", description: "Meaty!")
chef_c.dishes.create!(name: "Hummus", description: "Smooth")
chef_c.dishes.create!(name: "Salsa", description: "Spicey!")
chef_c.dishes.create!(name: "Gaucamole", description: "Fresh!")
