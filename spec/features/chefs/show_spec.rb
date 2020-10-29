require 'rails_helper'

RSpec.describe "chef show page", type: :feature do
  it "can display the chefs attributes" do
    chef_1 = Chef.create!(name: "Master Chef Tingo")
    dish_1 = chef_1.dishes.create!(name: "Shrimp Fried Rice", description: "Hails from the great hills of Japan.")
    ingredient_1 = Ingredient.create!(name: "Black Dragon Rice", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Sweet Orange Nectar from the Killer Bee", calories: 1000)
    dish_1.ingredients << ingredient_1
    dish_1.ingredients << ingredient_2
    chef_1.dishes << dish_1
      visit "/chefs/#{chef_1.id}"
      expect(page).to have_content(chef_1.name)
      expect(page).to have_link("Chef's Ingredients")
      click_on "Chef's Ingredients"
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end
end
