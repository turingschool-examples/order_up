# spec/features/dishes/show_spec.rb

require 'rails_helper'

RSpec.describe 'DISHES SHOW PAGE' do
  before :each do
    @chef = Chef.create!(name: 'Elzar')
    @dish = @chef.dishes.create!(name: 'Spice Cake', description: 'A tasty but spicy cake')

  end

  it 'displays dishes name, description, and chefs name' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to have_content(@chef.name)
  end

  it 'also displays list of ingredients in dish' do
    ing_1 = @dish.ingredients.create!(name: 'cake', calories: 390)
    ing_2 = @dish.ingredients.create!(name: 'spice wezeal', calories: 5)

    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(ing_1.name)
    expect(page).to have_content(ing_2.name)
  end
end
