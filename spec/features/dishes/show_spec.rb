require 'rails_helper'

RSpec.describe Dish, type: :feature do
  describe 'when I visit a dishes show page' do
    it "displays the dish details, ingredients and associated chef" do
      el_hefe = Chef.create(name: "El Hefe")
      dish_1 = el_hefe.dishes.create(name: "Cubano", description: "Food Truck Cubano!")
      ingredient_1 = Ingredient.create(name: "Ham", calories: 50)
      ingredient_2 = Ingredient.create(name: "Mustard", calories: 5)
      ingredient_3 = Ingredient.create(name: "Bun", calories: 120)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_3.id)

      visit dish_path(dish_1.id)

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(el_hefe.name)
    end
  end
end
