# spec/features/chefs/show_spec.rb

require 'rails_helper'

RSpec.describe 'CHEFS SHOW PAGE' do
  before :each do
    @chef = Chef.create!(name: 'Elzar')
    @dish_1 = @chef.dishes.create!(name: 'Spice Cake', description: 'A tasty but spicy cake')
    @ing_1 = @dish_1.ingredients.create!(name: 'cake', calories: 390)
    @ing_2 = @dish_1.ingredients.create!(name: 'spice wezeal', calories: 5)

    @dish_2 = @chef.dishes.create!(name: 'Grilled Chicken', description: 'Everything is better grilled, even chicken.')
    @ing_3 = @dish_2.ingredients.create!(name: 'chicken', calories: 200)
    @ing_4 = @dish_2.ingredients.create!(name: 'grill spices', calories: 5)

    visit "/chefs/#{@chef.id}"
  end

  it 'displays chefs name and has link to list all ingredients that chef uses in dishes' do
    expect(page).to have_content(@chef.name)
    expect(page).to have_link("List of all ingredients used")
  end

  it 'can goto the chefs ingredients index page' do
    click_link "List of all ingredients used"
  end
end
