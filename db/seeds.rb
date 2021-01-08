# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@chef = Chef.create!(name: "Tim")
@mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')
@pasta = @mac.ingredients.create!(name: 'pasta', calories: 1000)
@cheese = @mac.ingredients.create!(name: 'cheese', calories: 100)
