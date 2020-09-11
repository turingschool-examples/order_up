require 'rails_helper'

RSpec.describe "Chefs show page" do
  before (:each) do
    @wolfgang = Chef.create(name: "Wolfgang Puck")

    @ribeye_potatoes = @wolfgang.dishes.create(name: "Classic Ribeye Steak with Potatoes", description: "Locally farmed and very tender")
    @ribeye = Ingredient.create(name: "Ribeye", calories: 350)
    @potatoes = Ingredient.create(name: "Potatoe", calories: 125)


    @lamb_asparagus = @wolfgang.dishes.create(name: "Rosemary Lamb Shank and Asparagus", description: "Best lamb ever")
    @lamb = Ingredient.create(name: "Lamb", calories: 200)
    @rosemary = Ingredient.create(name: "Rosemary", calories: 25)
    @asparagus = Ingredient.create(name: "Asparagus", calories: 100)

    DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @ribeye.id)
    DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @potatoes.id)
    DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @rosemary.id)

    DishIngredient.create(dish_id: @lamb_asparagus.id, ingredient_id: @lamb.id)
    DishIngredient.create(dish_id: @lamb_asparagus.id, ingredient_id: @asparagus.id)
    DishIngredient.create(dish_id: @lamb_asparagus.id, ingredient_id: @rosemary.id)
  end

  it "I see the chef’s name and a link to view chef's ingredients" do

    visit "/chefs/#{@wolfgang.id}"

    expect(page).to have_content(@wolfgang.name)
    expect(page).to have_link("All Chefs Ingredients")
  end

  it "link takes me to index page with unique list of all the ingredients this chef uses" do

    visit "/chefs/#{@wolfgang.id}"

    click_link "All Chefs Ingredients"

    expect(current_path).to eq("/chefs/#{@wolfgang.id}/ingredients")

    expect(page).to have_content(@ribeye.name)
    expect(page).to have_content(@potatoes.name)
    expect(page).to have_content(@lamb.name)
    expect(page).to have_content(@rosemary.name)
    expect(page).to have_content(@asparagus.name)
  end
end
