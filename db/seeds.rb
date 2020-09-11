# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef1 = Chef.create(name: 'Chef Un')
chef2 = Chef.create(name: 'Chef Deux')

pasta = Dish.create(name: 'La pasta', description:'La best pasta', chef: chef1)
lasagna = Dish.create(name: 'La lasagna', description:'La best lasagna', chef: chef1)

tomato_sause = Ingredient.create(name: 'tomato sause', calories: 10)
meat_balls = Ingredient.create(name: 'meat balls', calories: 100)
salt = Ingredient.create(name: 'salt', calories: 1)
flat_pasta = Ingredient.create(name: 'flat pasta', calories: 150)

Recipe.create(dish: pasta, ingredient: tomato_sause)
Recipe.create(dish: pasta, ingredient: meat_balls)
Recipe.create(dish: pasta, ingredient: salt)

Recipe.create(dish: lasagna, ingredient: tomato_sause)
Recipe.create(dish: lasagna, ingredient: flat_pasta)
Recipe.create(dish: lasagna, ingredient: salt)
