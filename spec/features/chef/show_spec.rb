require 'rails_helper'

RSpec.describe "chef show page" do 
  before :each do 
    @chef1 = Chef.create!(name: "mario")
    @dish1 = Dish.create!(name: "pasta", description: "italian", chef: @chef1)
    @ingredient1 = Ingredient.create!(name: "tomatoes", calories: 10)
    @ingredient2 = Ingredient.create!(name: "noddles", calories: 50)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    visit chef_path(@chef1.id)
  end

  it "displays chef's name" do 
    expect(page).to have_content(@chef1.name)
  end

  it "has a link to view a list of all ingredients the chef uses in their dishes" do 
    expect(page).to have_link("all ingredients this chef uses")
    click_link "all ingredients this chef uses"
    expect(current_path).to eq(chef_ingredients_path(@chef1.id))
  end
  
end