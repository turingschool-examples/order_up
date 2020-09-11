require 'rails_helper'

RSpec.describe 'When I visit a dishs show page' do
  it 'the dish’s name and description, ingredients, and chefs name' do

    emeril = Chef.create(name: "Emeril Legasse")

    lasagna = emeril.dishes.create(name: "Lasagna", description: "A nice layered pasta with red sauce, ricotta, and ground beef" )

    red_sauce = Ingredient.create(name: "Red Sauce", calories: 200)
    beef = Ingredient.create(name: "Ground Beef", calories: 500)
    ricotta = Ingredient.create(name: "Ricotta", calories: 700)

    DishIngredient.create(ingredient_id: red_sauce.id, dish_id: lasagna.id)
    DishIngredient.create(ingredient_id: beef.id, dish_id: lasagna.id)
    DishIngredient.create(ingredient_id: ricotta.id, dish_id: lasagna.id)

    visit "/dishes/#{lasagna.id}"
save_and_open_page
    expect(page).to have_content("#{lasagna.name}")
    expect(page).to have_content("#{red_sauce.name}")
    expect(page).to have_content("#{beef.name}")
    expect(page).to have_content("#{ricotta.name}")
    expect(page).to have_content("#{emeril.name}")
    expect(page).to have_content("Total Calories: 1400")

  end
end
