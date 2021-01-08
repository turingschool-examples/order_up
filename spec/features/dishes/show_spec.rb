require "rails_helper"

RSpec.describe "Dish show page" do
  it "displays relevant information" do
    chef = Chef.create(name: "Rordan Gamsey")
    dish = chef.dishes.create(name: "Water", description: "A glass of water")
    lemon = Ingredient.create(name: "Artisinal slice of lemon", calories: 6)
    h = Ingredient.create(name: "H", calories: 0)
    o = Ingredient.create(name: "O", calories: 0)
    Component.create(dish_id: dish.id, ingredient_id: h.id, amount: 2)
    Component.create(dish_id: dish.id, ingredient_id: o.id, amount: 1)
    Component.create(dish_id: dish.id, ingredient_id: lemon.id, amount: 1)

    visit dish_path(dish)

    expect(page).to have_content("Dish: #{dish.name}")
    expect(page).to have_content("Description: #{dish.description}")

    dish.ingredients.each do | ingredient |
      within "#ingredient-#{ingredient.id}" do
        expect(page).to have_content(ingredient.name)
      end
    end
    expect(page).to have_content("Chef: #{dish.chef.name}")
  end
end