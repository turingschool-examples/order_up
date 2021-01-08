require 'rails_helper'

RSpec.describe 'Chef show page' do
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

    visit chef_path(@chef1)
  end
  it "displays the name of the chef" do
    expect(page).to have_content(@chef1.name)
  end

  it "has a link to the chef's ingredients page" do
    expect(page).to have_link("Ingredients Used")
    click_link "Ingredients Used"
    expect(current_path).to eq(chef_ingredients_path(@chef1))
  end

end
