require "rails_helper"

describe "dishes show page" do
  it "can see the dishes name and description" do
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
  visit "/dishes/#{dish_1.id}"
  # visit "dish(#{dish_1.id})"
  expect(page).to have_content(dish_1.name)
  expect(page).to have_content(dish_1.description)
  expect(page).to have_content(dish_1.description)
  expect(page).to have_content(ingredient_1.name)
  expect(page).to have_content(ingredient_2.name)
  expect(page).to have_content(chef_1.name)
  end
end
