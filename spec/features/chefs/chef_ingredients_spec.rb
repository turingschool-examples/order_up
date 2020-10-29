require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit a chef's show page" do
    it "I can click a link to see the chef's ingredient index with a unique list of ingredient names" do
      franc = Chef.create!(name: "Francois Francesco")
      ratatouille = franc.dishes.create!(
                                          name: "Ratatouille",
                                          description: "Spicy and delicious!"
                                        )
      spaghetti = franc.dishes.create!(
                                          name: "Spaghetti and Meatballs",
                                          description: "Mouthwatering and flavourful."
                                        )
      egg = Ingredient.create!(name: "eggplant", calories: 100)
      tomato = Ingredient.create!(name: "tomato", calories: 80)
      zucc = Ingredient.create!(name: "zucchini", calories: 120)

      basil = Ingredient.create!(name: "basil", calories: 20)
      sausage = Ingredient.create!(name: "italian sausage", calories: 200)
      wine = Ingredient.create!(name: "Cabernet Sauvignon", calories: 150)

      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: egg.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: basil.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: zucc.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: sausage.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: wine.id)
      DishIngredient.create!(dish_id: spaghetti.id, ingredient_id: basil.id)

      visit chef_path(franc)

      expect(page).to have_content(franc.name)

      click_link("Ingredients")

      expect(current_path).to eq(chef_ingredients_path(franc))

      within ".ingredients" do
        expect(page).to have_content(egg.name)
        expect(page).to have_content(basil.name)
        expect(page).to have_content(tomato.name)
        expect(page).to have_content(zucc.name)
        expect(page).to have_content(sausage.name)
        expect(page).to have_content(wine.name)
        expect(page).to have_css(".ingredient", count:6)
      end
    end

  end
end
