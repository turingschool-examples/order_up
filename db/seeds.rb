# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all

FactoryBot.create_list(:chef, 5)
FactoryBot.create_list(:ingredient, 10)

5.times do
  Chef.all.each do |chef|
    chef.dishes.create(name: Faker::Books::Dune.title, description: Faker::Books::Dune.quote)
  end
end

3.times do
  Dish.all.each do |dish|
    DishIngredient.create!(dish: dish, ingredient: Ingredient.all.sample, count: Faker::Number.between(from: 0, to: 5))
  end
end
