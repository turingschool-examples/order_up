# User Story 3 of 3
# As a visitor
# - When I visit a chef's show page
# - I see the name of that chef
# - And I see a link to view a list of all ingredients that this chef uses in their dishes
# - When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

require 'rails_helper'

RSpec.describe "Chef's Show page" do

  it "can see the name of that chef and a link to view chef's ingredient index" do

  chef_1 = Chef.create!(name: "Emeril Lagasse")
  dish_1 = chef_1.dishes.create!(name: "Jalapeno Cornbread", description: "The cornbread has the perfect texture and the jalapenos add a great kick.")
  corn = dish_1.ingredients.create!(name: "corn", calories: 132)
  milk = dish_1.ingredients.create!(name: "milk", calories: 122)
  jalapeno = dish_1.ingredients.create!(name: "jalapeno", calories: 4)
  flour = dish_1.ingredients.create!(name: "flour", calories: 100)

  visit "/chefs/#{chef_1.id}"

  expect(page).to have_content(chef_1.name)

  click_link "Chef's Ingredient Index"

  expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")

  expect(page).to have_content(corn.name)
  expect(page).to have_content(milk.name)
  expect(page).to have_content(jalapeno.name)
  expect(page).to have_content(flour.name)
  end
end
