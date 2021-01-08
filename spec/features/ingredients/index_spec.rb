require 'rails_helper'

RSpec.describe 'Ingredient Index page' do
  before :each do
    @gusteau = Chef.create!(name: "Gusteau")

    @soupy = @gusteau.dishes.create!(name: "Warm Soup", description: "I think it has potatoes and cream or something idk the rat messed it up")
    @pbsquid = @gusteau.dishes.create!(name: "Squid Dressed with Peanut Butter", description: "It's so bad it's laughable")
    @pbsoup = @gusteau.dishes.create!(name: "Peanut butter soup", description: "created for the purpose of testing that uniq ingredients show up")

    @potato = Ingredient.create!(name: "Potato", calories: 10)
    @cream = Ingredient.create!(name: "Heavy Whipping Cream", calories: 17)
    @squid = Ingredient.create!(name: "A Whole Squid", calories: 103)
    @pb = Ingredient.create!(name: "Smooth Peanut Butter", calories: 16)

    IngredientsList.create!(dish_id: @soupy.id, ingredient_id: @potato.id)
    IngredientsList.create!(dish_id: @soupy.id, ingredient_id: @cream.id)
    IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @squid.id)
    IngredientsList.create!(dish_id: @pbsquid.id, ingredient_id: @pb.id)
    IngredientsList.create!(dish_id: @pbsoup.id, ingredient_id: @pb.id)
    IngredientsList.create!(dish_id: @pbsoup.id, ingredient_id: @cream.id)

    visit "/chefs/#{@gusteau.id}/ingredients/index"
  end

  it "displays the uniq ingredients used by a chef" do
    expect(page).to have_content(@potato.name)
    expect(page).to have_content(@cream.name)
    expect(page).to have_content(@squid.name)
    expect(page).to have_content(@pb.name)
  end
end
