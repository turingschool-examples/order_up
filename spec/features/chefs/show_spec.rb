require "rails_helper"

RSpec.describe "Chef show page" do
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

    visit chef_path(chef)

    expect(page).to have_content("Chef: #{chef.name}")
    expect(page).to have_link("Ingredients", href: chef_ingredients_path(chef))
    chef.popular_ingredients(3).each do | ingredient |
      expect(page).to have_content(ingredient)
    end
    expect(page).not_to have_content(ice.name)
  end
end