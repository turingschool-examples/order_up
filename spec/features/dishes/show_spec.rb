# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
require 'rails_helper'

RSpec.describe "As a visitor, when I visit a dish's show page", type: :feature do
  it "I see the dish name and description, list of ingredients, and the chefs name" do

    chef_1 = Chef.create!(name: "Dan")
    chef_2 = Chef.create!(name: "Babish")
    dish_1 = chef_1.dishes.create!(name: "A Dish", description: "A Description")
    dish_2 = chef_1.dishes.create!(name: "B Dish", description: "B Description")
    dish_3 = chef_2.dishes.create!(name: "C Dish", description: "C Description")
    ingredient_1 = Ingredient.create!(name: "A Ingredient", calories: 100)
    ingredient_2 = Ingredient.create!(name: "B Ingredient", calories: 300)
    ingredient_3 = Ingredient.create!(name: "C Ingredient", calories: 400)
    ingredient_4 = Ingredient.create!(name: "D Ingredient", calories: 200)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

    visit("/dishes/#{dish_1.id}")
    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    dish_1.ingredients.each do |ingred|
      expect(page).to have_content(ingred.name)
    end
    expect(page).to have_content(dish_1.chef.name)
  end

  it "I see the total calorie count for that dish" do

    chef_1 = Chef.create!(name: "Dan")
    chef_2 = Chef.create!(name: "Babish")
    dish_1 = chef_1.dishes.create!(name: "A Dish", description: "A Description")
    dish_2 = chef_1.dishes.create!(name: "B Dish", description: "B Description")
    dish_3 = chef_2.dishes.create!(name: "C Dish", description: "C Description")
    ingredient_1 = Ingredient.create!(name: "A Ingredient", calories: 100)
    ingredient_2 = Ingredient.create!(name: "B Ingredient", calories: 300)
    ingredient_3 = Ingredient.create!(name: "C Ingredient", calories: 400)
    ingredient_4 = Ingredient.create!(name: "D Ingredient", calories: 200)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

    visit("/dishes/#{dish_1.id}")
    expect(page).to have_content(dish_1.total_calories)
  end
end
