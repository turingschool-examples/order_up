require 'rails_helper'

RSpec.describe "Dishes show page" do
  before (:each) do
    @wolfgang = Chef.create(name: "Wolfgang Puck")
    @ribeye_potatoes = @wolfgang.dishes.create(name: "Classic Ribeye Steak with Potatoes", description: "Locally farmed and very tender")
    @ribeye = Ingredient.create(name: "Ribeye", calories: 350)
    @potatoes = Ingredient.create(name: "Potatoe", calories: 125)

    DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @ribeye.id)
    DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @potatoes.id)
  end

  it "I see the dish’s name, description, ingredients and I see the chef's name" do

    visit "/dishes/#{@ribeye_potatoes.id}"

    expect(page).to have_content(@ribeye_potatoes.name)
    expect(page).to have_content(@ribeye_potatoes.description)
    expect(page).to have_content(@ribeye.name)
    expect(page).to have_content(@potatoes.name)
    expect(page).to have_content(@wolfgang.name)
  end

  it "I see the total calorie count for that dish." do

    visit "/dishes/#{@ribeye_potatoes.id}"

    expect(page).to have_content("Total Calories: 475")
  end
end
