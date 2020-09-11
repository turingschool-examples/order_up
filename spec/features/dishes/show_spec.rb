require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  it "has a dish name, description, ingredients, and the chef's name" do
    chef = Chef.create(name: "Chris")
    dish = chef.dishes.create(name: "pizza", description: "tasty")

    visit "/dishes/#{dish.id}"

    expect(page).to have_content(dish.name)
  end
end
