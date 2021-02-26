# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    @chef = Chef.create(name: "Bob")
    @dish = @chef.dishes.create(name: 'Pasta', description: 'Taste good')
    @ingredient1 = @dish.ingredients.create(name: 'oregano', calories: 0)
    @ingredient2 = @dish.ingredients.create(name: 'butter', calories: 10)