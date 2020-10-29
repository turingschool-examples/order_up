require 'rails_helper'

RSpec.describe "dish show page", type: :feature do
  it "can display the dishes attributes" do
    chef_1 = Chef.create!(name: "Master Chef Tingo")
    dish_1 = chef_1.dishes.create!(name: "Shrimp Fried Rice", description: "Hails from the great hills of Japan.")
    ingredient_1 = Ingredient.create!(name: "Black Dragon Rice", calories: 100)
    ingredient_2 = Ingredient.create!(name: "Sweet Orange Nectar from the Killer Bee", calories: 1000)
    dish_1.ingredients << ingredient_1
    dish_1.ingredients << ingredient_2
    chef_1.dishes << dish_1

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(chef_1.name)
    expect(page).to have_content("Calories: #{dish_1.calorie_count}")
  end
end
