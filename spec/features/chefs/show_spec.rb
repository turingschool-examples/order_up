require 'rails_helper'

RSpec.describe Chef, type: :feature do
  describe 'when I visit a chefs show page' do
    it "displays the chefs name, a link to view all the unique ingredients the chef uses" do
      el_hefe = Chef.create(name: "El Hefe")
      dish_1 = el_hefe.dishes.create(name: "Cubano", description: "Food Truck Cubano!")
      ingredient_1 = Ingredient.create(name: "Ham", calories: 50)
      ingredient_2 = Ingredient.create(name: "Mustard", calories: 5)
      ingredient_3 = Ingredient.create(name: "Bun", calories: 120)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_3.id)

      visit chef_path(el_hefe.id)
      expect(page).to have_content(el_hefe.name)

      click_on "Ingredients used by Chef"

      expect(current_path).to eq(chef_ingredients_path(@el_hefe.id))
    end
  end
end
