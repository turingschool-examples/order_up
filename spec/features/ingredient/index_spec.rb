require 'rails_helper'

RSpec.describe "chef's ingredients index page" do 
  before :each do 
    @chef1 = Chef.create!(name: "mario")
    @dish1 = Dish.create!(name: "pasta", description: "italian", chef: @chef1)
    @ingredient1 = Ingredient.create!(name: "tomatoes", calories: 10)
    @ingredient2 = Ingredient.create!(name: "noddles", calories: 50)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    visit chef_ingredients_path(@chef1.id)
  end

  it "displays a unique list of names of all ingredients that this chef uses" do 
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
  end
end