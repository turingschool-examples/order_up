require 'rails_helper'

describe 'chef show page' do
  it 'can visit a chef show page and see chef name and see a link to see
    all of their used ingredients' do
    chef_1 = Chef.create(name: "Mario")
    dish_1 = Dish.create(name: "Spaghetti",
                         description: "Pasta",
                         chef_id: chef_1.id)
    ingredient_1 = Ingredient.create(name: "Sauce",
                                     calories: 300)
    ingredient_2 = Ingredient.create(name: "Noodles",
                                     calories: 500)
    recipe_1 = Recipe.create(dish_id: dish_1.id,
                            ingredient_id: ingredient_1.id)
    recipe_1 = Recipe.create(dish_id: dish_1.id,
                             ingredient_id: ingredient_2.id)


    visit "/chefs/#{chef_1.id}"

    expect(page).to have_content(chef_1.name)
    expect(page).to have_link("View ingredients used")

    visit "/chefs/#{chef_1.id}/ingredients"

  end
end
