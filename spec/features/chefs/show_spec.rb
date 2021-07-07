require 'rails_helper'

RSpec.describe "chef show page", type: :feature do
  it "can display the chefs attributes" do
    chef_1 = Chef.create!(name: "Dave")
    dish_1 = chef_1.dishes.create!(name: "Meatloaf", description: "its yummy")
    ingredient_1 = Ingredient.create!(name: "parsley")
    ingredient_2 = Ingredient.create!(name: "pepper")
    Recipe.create!(dish: dish_1, ingredient: ingredient_1)
    visit "/chefs/#{chef_1.id}"

    expect(page).to have_content(chef_1.name)
    expect(page).to have_link("Chef's Ingredients")

    binding.pry
    click_on "Chef's Ingredients"
    expect(current_path).to eq("/chefs/:id/ingredients")
    expect(page).to have_content("Ingredients Used: parsley")
  end
end
