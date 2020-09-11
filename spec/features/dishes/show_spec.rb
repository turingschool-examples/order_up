require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  it "has a dish name, description, ingredients, and the chef's name" do
    chef = Chef.create(name: "Chris")
    dish = chef.dishes.create(name: "pizza", description: "tasty")
    ingredient = dish.ingredients.create(name: "sauce", calories: 240)
    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)
    expect(page).to have_content(dish.ingredients.name)
    expect(page).to have_content(dish.chef.name)
  end
end
