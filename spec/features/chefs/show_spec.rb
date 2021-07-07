# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
require 'rails_helper'

RSpec.describe "As a visitor, when I visit a chefs show page", type: :feature do
  it "I see the name, a link to view a list of all ingredients used in their dishes, and a unique list of ingredient names" do

    chef_1 = Chef.create!(name: "Dan")
    dish_1 = chef_1.dishes.create!(name: "A Dish", description: "A Description")
    dish_2 = chef_1.dishes.create!(name: "B Dish", description: "B Description")
    ingredient_1 = Ingredient.create!(name: "A Ingredient", calories: 100)
    ingredient_2 = Ingredient.create!(name: "B Ingredient", calories: 300)
    ingredient_3 = Ingredient.create!(name: "C Ingredient", calories: 400)
    ingredient_4 = Ingredient.create!(name: "D Ingredient", calories: 200)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)

    visit("/chefs/#{chef_1.id}")
    expect(page).to have_content(chef_1.name)
    expect(page).to have_link("All Ingredients")
    click_link("All Ingredients")
    expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")
    expect(page).to have_content("A Ingredient", count:1)
    expect(page).to have_content("B Ingredient", count:1)
    expect(page).to have_content("C Ingredient", count:1)
  end
end
