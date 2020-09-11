require 'rails_helper'

RSpec.describe 'dish show page' do
  it 'can display dish name, description, list of ingredients, and what chef it belongs to' do
    chef = Chef.create!(name: "Ratatouille")
    dish1 = chef.dishes.create!(name: "Pasta", description: "Angel hair noodles")
    dish2 = chef.dishes.create!(name: "Garlic Bread", description: "French bread with garlic and butter")
    
  end

end

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
#
# Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
#
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
