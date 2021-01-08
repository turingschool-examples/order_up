require 'rails_helper'

RSpec.describe 'Dishes show page' do
  before :each do
    @chef1 = Chef.create!(name: "Catherine")
    @dish1 = Dish.create!(name: "Mac and Cheese", description: "So cheesy!", chef_id: @chef1.id )
    @dish2 = Dish.create!(name: "Cheese Fries", description: "So cheesy! So fries!", chef_id: @chef1.id )
    @ingredient1 = Ingredient.create!(name: "Mac", calories: 101)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 286)
    @ingredient3 = Ingredient.create!(name: "Fries", calories: 223)
    Recipe.create!(ingredient_id: @ingredient1.id, dish_id: @dish1.id)
    Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish1.id)
    Recipe.create!(ingredient_id: @ingredient3.id, dish_id: @dish2.id)
    Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)

    visit dish_path(@dish1)
  end

  it "displays the the dish's name and description" do
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to_not have_content(@dish2.name)
    expect(page).to_not have_content(@dish2.description)
  end

  it "displays a list of ingredients for that dish" do
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to_not have_content(@ingredient3.name)
  end

  it "displays the chef's name" do
    expect(page).to have_content(@chef1.name)
  end

  it "displays the total calorie count for the dish" do
    expect(page).to have_content(@dish1.calorie_count)
  end

end
