require 'rails_helper'

RSpec.describe 'Ingredients index page' do
  before :each do
    @chef1 = Chef.create!(name: "Catherine")
    @dish1 = Dish.create!(name: "Mac and Cheese", description: "So cheesy!", chef_id: @chef1.id )
    @dish2 = Dish.create!(name: "Cheese Fries", description: "So cheesy! So fries!", chef_id: @chef1.id )
    @dish3 = Dish.create!(name: "Apple Pie", description: "Classic Grandma's house vibes", chef_id: @chef1.id )
    @dish4 = Dish.create!(name: "Berry Pie", description: "Best with vanilla ice cream", chef_id: @chef1.id )
    @ingredient1 = Ingredient.create!(name: "Mac", calories: 101)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 286)
    @ingredient3 = Ingredient.create!(name: "Fries", calories: 223)
    @ingredient4 = Ingredient.create!(name: "Apples", calories: 63)
    @ingredient5 = Ingredient.create!(name: "Pie dough", calories: 167)
    @ingredient6 = Ingredient.create!(name: "Berries", calories: 98)
    Recipe.create!(ingredient_id: @ingredient1.id, dish_id: @dish1.id)
    Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish1.id)
    Recipe.create!(ingredient_id: @ingredient3.id, dish_id: @dish2.id)
    Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)
    Recipe.create!(ingredient_id: @ingredient4.id, dish_id: @dish3.id)
    Recipe.create!(ingredient_id: @ingredient5.id, dish_id: @dish3.id)
    Recipe.create!(ingredient_id: @ingredient5.id, dish_id: @dish4.id)
    Recipe.create!(ingredient_id: @ingredient6.id, dish_id: @dish4.id)

    @chef2 = Chef.create!(name: "Andrew")
    @dish5 = Dish.create!(name: "Stir Fry", description: "yum", chef_id: @chef2.id)
    @ingredient7 = Ingredient.create!(name: "Broccolini", calories: 45)
    Recipe.create!(ingredient_id: @ingredient7.id, dish_id: @dish5.id)

    visit chef_ingredients_path(@chef1)
  end

  it "displays a unique list of all ingredients used by chef" do
    expect(page).to have_content(@ingredient1.name, count: 1)
    expect(page).to have_content(@ingredient2.name, count: 1)
    expect(page).to have_content(@ingredient3.name, count: 1)
    expect(page).to have_content(@ingredient4.name, count: 1)
    expect(page).to have_content(@ingredient5.name, count: 1)
    expect(page).to have_content(@ingredient6.name, count: 1)
    expect(page).to_not have_content(@ingredient7.name)
  end

  xit "can display dishes by recipe" do
    fill_in "Ingredient", with: "Cheese"
    click_button "Search for recipes"

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish2.name)
  end
end
