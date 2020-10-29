require 'rails_helper'

RSpec.describe 'On the dish show page' do
  it "it has the dish name, decription, chef's name, and a list of ingredients" do 
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
    
    visit "dishes/#{dish_1.id}"

    expect(page).to have_content("#{chef_1.name}")
    expect(page).to have_content("#{dish_1.name}")
    expect(page).to have_content("#{dish_1.description}")
    expect(page).to have_content("#{ingredient_1.name}")
    expect(page).to have_content("#{ingredient_2.name}")
    expect(page).to have_content("#{ingredient_3.name}")
    expect(page).to have_content("Calories: 800")
  end
end