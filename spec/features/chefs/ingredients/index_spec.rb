require "rails_helper"

RSpec.describe "Chef Ingredient Index page" do
  it "displays relevant information" do
    chef = Chef.create(name: "Rordan Gamsey")
    dish2 = chef.dishes.create(name: "Water", description: "A glass of water")
    dish = chef.dishes.create(name: "Ice Water", description: "A glass of ice water")
    lemon = Ingredient.create(name: "Artisinal slice of lemon", calories: 6)
    h = Ingredient.create(name: "H", calories: 0)
    o = Ingredient.create(name: "O", calories: 0)
    ice = Ingredient.create(name: "Ice", calories: 1)
    Component.create(dish_id: dish.id, ingredient_id: h.id, amount: 2)
    Component.create(dish_id: dish.id, ingredient_id: o.id, amount: 1)
    Component.create(dish_id: dish.id, ingredient_id: lemon.id, amount: 1)
    Component.create(dish_id: dish2.id, ingredient_id: h.id, amount: 2)
    Component.create(dish_id: dish2.id, ingredient_id: o.id, amount: 1)
    Component.create(dish_id: dish2.id, ingredient_id: lemon.id, amount: 1)
    Component.create(dish_id: dish2.id, ingredient_id: ice.id, amount: 4)

    visit chef_ingredients_path(chef)

    chef.ingredients.each do | ingredient |
      within "#ingredient-#{ingredient.id}" do
        expect(page).to have_content(ingredient.name)
      end
    end
  end
end