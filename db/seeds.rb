# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Chefs
wolfgang = Chef.create(name: "Wolfgang Puck")
ramsey = Chef.create(name: "Gordon Ramsey")

#Dishes
ribeye = wolfgang.dishes.create(name: "Classic Ribeye Steak with Potatoes", description: "Locally farmed and very tender")
lamb = wolfgang.dishes.create(name: "Rosemary Lamb Shank and Asparagus", description: "Best lamb ever")

#Ingredients
ribeye = Ingredient.create(name: "Ribeye", calories: 350)
potatoes = Ingredient.create(name: "Potatoe", calories: 125)

lamb = Ingredient.create(name: "Lamb", calories: 200)
rosemary = Ingredient.create(name: "Rosemary", calories: 25)
asparagus = Ingredient.create(name: "Asparagus", calories: 100)
