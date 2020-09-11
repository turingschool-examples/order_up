# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dish.destroy_all
Ingredient.destroy_all
Chef.destroy_all

chef_1 = Chef.create(name: "Dave Chang")

dish_1 = chef_1.dishes.create(name: "Chawan Mushi", description: "steamed Japanese egg custard with mushrooms and crabmeat")
dish_2 = chef_1.dishes.create!(name: "Honey-Soy-Glazed Vegetables with Crispy Mushrooms", description: "Turnips and radishes with a mix of honey and soy sauce, served with sautéed shiitake mushrooms and an ingenious, crispy rice-cracker coating.")

ingredient_1 = dish_1.ingredients.create(name: "Mushrooms", calories: "65")
ingredient_2 = dish_1.ingredients.create(name: "Crabmeat", calories: "82")

ingredient_3 = dish_2.ingredients.create!(name: "Turnips", calories: "50")

dish_2.ingredients << ingredient_1


