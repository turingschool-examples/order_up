# spec/features/chef/ingredients/index_spec.rb

require 'rails_helper'

RSpec.describe "CHEFS INGREDIENTS INDEX PAGE" do
  before :each do
    @chef = Chef.create!(name: 'Elzar')
    @dish_1 = @chef.dishes.create!(name: 'Spice Cake', description: 'A tasty but spicy cake')
    @ing_1 = @dish_1.ingredients.create!(name: 'cake', calories: 390)
    @ing_2 = @dish_1.ingredients.create!(name: 'spice wezeal', calories: 5)

    @dish_2 = @chef.dishes.create!(name: 'Grilled Chicken', description: 'Everything is better grilled, even chicken.')
    @ing_3 = @dish_2.ingredients.create!(name: 'chicken', calories: 200)
    @ing_4 = @dish_2.ingredients.create!(name: 'grill spices', calories: 5)

    @ing_5 = Ingredient.create!(name: 'rando', calories: 1) # used for ensuring doesn't show up

    visit "/chefs/#{@chef.id}/ingredients"
  end

  it 'lists all distinct ingredients chef has used in all dishes' do
    expect(page).to have_content(@ing_1.name)
    expect(page).to have_content(@ing_2.name)
    expect(page).to have_content(@ing_3.name)
    expect(page).to have_content(@ing_4.name)
    expect(page).to_not have_content(@ing_5.name)
  end
end
