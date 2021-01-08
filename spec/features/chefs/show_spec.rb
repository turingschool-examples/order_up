require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do
    @gusteau = Chef.create!(name: "Gusteau")

    @soupy = @gusteau.dishes.create!(name: "Warm Soup", description: "I think it has potatoes and cream or something idk the rat messed it up")
    @pbsquid = @gusteau.dishes.create!(name: "Squid Dressed with Peanut Butter", description: "It's so bad it's laughable")

    @potato = Ingredient.create!(name: "Potato", calories: 10)
    @cream = Ingredient.create!(name: "Heavy Whipping Cream", calories: 17)
    @squid = Ingredient.create!(name: "A Whole Squid", calories: 103)
    @pb = Ingredient.create!(name: "Smooth Peanut Butter", calories: 16)

    IngredientsList.create!(dish_id: @soupy.id, ingredient_id: @potato.id)
    IngredientsList.create!(dish_id: @soupy.id, ingredient_id: @cream.id)
    IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @potato.id)
    IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @cream.id)

    visit "/chefs/#{@gusteau.id}"
  end

  it "displays the name of the chef" do

    expect(page).to have_content(@gusteau.name)
  end

  it "contains a link that takes you to the chef ingredient index page" do
    click_link("My Ingredients")

    expect(current_path).to eq("/chefs/#{@gusteau.id}/ingredients/index")
  end
end
