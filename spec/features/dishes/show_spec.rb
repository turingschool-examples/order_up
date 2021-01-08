require 'rails_helper'

RSpec.describe 'Dish show page' do
  before :each do
    @gusteau = Chef.create!(name: "Gusteau")

    @soupy = @gusteau.dishes.create!(name: "Warm Soup", description: "I think it has potatoes and cream or something idk the rat messed it up")
    @pbsquid = @gusteau.dishes.create!(name: "Squid Dressed with Peanut Butter", description: "It's so bad it's laughable")

    @potato = Ingredient.create!(name: "Potato", calories: 10)
    @cream = Ingredient.create!(name: "Heavy Whipping Cream", calories: 17)
    @squid = Ingredient.create!(name: "A Whole Squid", calories: 103)
    @pb = Ingredient.create!(name: "Smooth Peanut Butter", calories: 16)

    IngredientList.create!(dish_id: @soupy.id, ingredient_id: @potato.id)
    IngredientList.create!(dish_id: @soupy.id, ingredient_id: @cream.id)
    IngredientList.create!(dish_id: @pbsquid.id, ingredient_id: @potato.id)
    IngredientList.create!(dish_id: @pbsquid.id, ingredient_id: @cream.id)
  end

  it 'shows the name and description of each dish' do
    visit "/dishes/#{@soupy.id}"

    expect(page).to have_content(@soupy.name)
    expect(page).to have_content(@soupy.description)
  end

  it 'shows the ingredients used in the dish' do
    visit "/dishes/#{@soupy.id}"

    expect(page).to have_content(@potato.name)
    expect(page).to have_content(@cream.name)
  end

  # it 'shows the total calories used in the dish' do
  #   visit "/dishes/#{@soupy.id}"
  #
  #   expect(page).to
  # end
end
