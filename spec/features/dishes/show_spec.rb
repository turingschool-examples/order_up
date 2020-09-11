require 'rails_helper'

RSpec.describe "dish show page", type: :feature do
  it "can display the dishes attributes" do
    chef_1 = Chef.create!(name: "Dave")
    dish_1 = chef_1.dishes.create!(name: "Meatloaf", description: "its yummy")
    ingredient_1 = Ingredient.create!(name: "parsley")
    ingredient_2 = Ingredient.create!(name: "pepper")
    Recipe.create!(dish: dish_1, ingredient: ingredient_1)
    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content("parsley")
    save_and_open_page
    
    expect(page).to have_content("Dave")
  end

  end
