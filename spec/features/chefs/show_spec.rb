require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'can display dish name, description, list of ingredients, and what chef it belongs to' do
    chef = Chef.create!(name: "Ratatouille")
    dish1 = chef.dishes.create!(name: "Pasta", description: "Angel hair noodles")
    dish2 = chef.dishes.create!(name: "Garlic Bread", description: "French bread with garlic and butter")
    ingredient1 = Ingredient.create!(name: "Noodles", calories: 400)
    ingredient2 = Ingredient.create!(name: "Butter", calories: 100)
    ingredient3 = Ingredient.create!(name: "Bread", calories: 200)
    ingredient4 = Ingredient.create!(name: "Garlic", calories: 50)
    ingredient5 = Ingredient.create!(name: "Chocolate", calories: 200)
    IngredientsDish.create!(ingredient_id: ingredient1.id, dish_id: dish1.id)
    IngredientsDish.create!(ingredient_id: ingredient2.id, dish_id: dish1.id)
    IngredientsDish.create!(ingredient_id: ingredient3.id, dish_id: dish2.id)
    IngredientsDish.create!(ingredient_id: ingredient4.id, dish_id: dish2.id)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)

    click_link 'Chef Ingredients'

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient3.name)
    expect(page).to have_content(ingredient4.name)
    expect(page).to_not have_content(ingredient5.name)
  end
end

# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
#
# Extension
# As a visitor
# When I visit a chef's show page
# I see the three most popular ingredients that the chef uses in their dishes
# (Popularity is based off of how many dishes use that ingredient)
