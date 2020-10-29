require 'rails_helper'

RSpec.describe 'On the chef ingredients index page' do
  it "there's a list of all the ingredients the chef uses" do 
    chef_1 = Chef.create!(name: 'Pierre')
    dish_1 = chef_1.dishes.create!(name: 'Crepes',
                                  description: 'fruity omelette/pancake')
    ingredient_1 = dish_1.ingredients.create!(name: 'Flour',
                    calories: 200)
    ingredient_2 = dish_1.ingredients.create!(name: 'Eggs',
                    calories: 100)
    ingredient_3 = dish_1.ingredients.create!(name: 'Milk',
                    calories: 200)
    ingredient_4 = dish_1.ingredients.create!(name: 'Butter',
                    calories: 300)
    dish_2 = chef_1.dishes.create!(name: 'Chocolate Strawberries',
                                  description: 'Strawberries dipped in choclate')
    ingredient_5 = dish_2.ingredients.create!(name: 'Chocolate',
                                              calories: 400)
    ingredient_6 = dish_2.ingredients.create!(name: 'Strawberries',
                                              calories: 100)
    visit "/chefs/#{chef_1.id}"
    
    click_on "Ingredients #{chef_1.name} Uses"
    expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")

    expect(page).to have_content("#{ingredient_1.name}")
    expect(page).to have_content("#{ingredient_2.name}")
    expect(page).to have_content("#{ingredient_3.name}")
    expect(page).to have_content("#{ingredient_4.name}")
    expect(page).to have_content("#{ingredient_5.name}")
    expect(page).to have_content("#{ingredient_6.name}")
  end 
end 