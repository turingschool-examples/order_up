require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  it "has a dish name, description, ingredients, and the chef's name" do
    chef = Chef.create(name: "Chris")
    dish = chef.dishes.create(name: "pizza", description: "tasty", ingredients: "cheese and sauce")

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)
    expect(page).to have_content(dish.ingredients)
    expect(page).to have_content(dish.chef.name)
  end
end
