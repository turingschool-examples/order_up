require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "when I visit a dish's show page" do
    it "I see the dish's name, description, a list of its ingredients, and the chef's name" do
      franc = Chef.create!(name: "Francois Francesco")
      ratatouille = franc.dishes.create!(
                                          name: "Ratatouille",
                                          description: "Spicy and delicious!"
                                        )
      egg = Ingredient.create!(name: "eggplant", calories: 100)
      tomato = Ingredient.create!(name: "tomato", calories: 80)
      zucc = Ingredient.create!(name: "zucchini", calories: 120)

      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: egg.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: zucc.id)

      visit dish_path(ratatouille)

      within ".dish" do
        expect(page).to have_content(ratatouille.name)
        expect(page).to have_content(ratatouille.description)
      end

      within ".chef" do
        expect(page).to have_content(franc.name)
      end

      within ".ingredients" do
        expect(page).to have_content(egg.name)
        expect(page).to have_content(tomato.name)
        expect(page).to have_content(zucc.name)
        expect(page).to have_css(".ingredient", count:3)
      end

    end
  end
end
