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
  end

  it 'displays chefs name and has link to list all ingredients that chef uses in dishes' do
    visit "/chefs/#{@chef.id}"
    expect(page).to have_content(@chef.name)
    expect(page).to have_link("List of all ingredients used")
  end

  it 'can goto the chefs ingredients index page' do
    visit "/chefs/#{@chef.id}"
    click_link "List of all ingredients used"
  end

  it 'displays three most popular ingredients based on how many dishes that ingredient is in' do
    dish_3 = @chef.dishes.create!(name: 'Meat Kebab', description: 'The best darn kebabs in the city')
    dish_3.ingredients.create!(name: 'lamb', calories: 215)
    dish_3.ingredients << @ing_2 #spice wezeal
    dish_3.ingredients << @ing_3 #chicken
    dish_3.ingredients << @ing_4 #grilling spices

    visit "/chefs/#{@chef.id}"
    expect(page).to have_content("Three most popular ingredients: ")
    expect(page).to have_content(@ing_2.name, @ing_3.name, @ing_4.name)
  end
end
