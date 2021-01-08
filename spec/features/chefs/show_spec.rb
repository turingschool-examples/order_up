require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do
    @chef1 = Chef.create!(name: "Catherine")
    @dish1 = Dish.create!(name: "Mac and Cheese", description: "So cheesy!", chef_id: @chef1.id )
    @dish2 = Dish.create!(name: "Cheese Fries", description: "So cheesy! So fries!", chef_id: @chef1.id )
    @dish3 = Dish.create!(name: "Apple Pie", description: "Classic Grandma's house vibes", chef_id: @chef1.id )
    @dish4 = Dish.create!(name: "Berry Pie", description: "Best with vanilla ice cream", chef_id: @chef1.id )
    @dish5 = Dish.create!(name: "Truffle Fries", description: "like mushrooms, not chocolate", chef_id: @chef1.id )
    @ingredient1 = Ingredient.create!(name: "Mac", calories: 101)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 286)
    @ingredient3 = Ingredient.create!(name: "Fries", calories: 223)
    @ingredient4 = Ingredient.create!(name: "Apples", calories: 63)
    @ingredient5 = Ingredient.create!(name: "Pie dough", calories: 167)
    @ingredient6 = Ingredient.create!(name: "Berries", calories: 98)
    @ingredient7 = Ingredient.create!(name: "Truffles", calories: 36)
    Recipe.create!(ingredient_id: @ingredient1.id, dish_id: @dish1.id)
    Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish1.id)
    Recipe.create!(ingredient_id: @ingredient3.id, dish_id: @dish2.id)
    Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)
    Recipe.create!(ingredient_id: @ingredient4.id, dish_id: @dish3.id)
    Recipe.create!(ingredient_id: @ingredient5.id, dish_id: @dish3.id)
    Recipe.create!(ingredient_id: @ingredient5.id, dish_id: @dish4.id)
    Recipe.create!(ingredient_id: @ingredient6.id, dish_id: @dish4.id)
    Recipe.create!(ingredient_id: @ingredient7.id, dish_id: @dish5.id)
    Recipe.create!(ingredient_id: @ingredient3.id, dish_id: @dish5.id)

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

  it "displays the top 3 ingredients used by a chef" do
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to_not have_content(@ingredient1.name)
  end

end
