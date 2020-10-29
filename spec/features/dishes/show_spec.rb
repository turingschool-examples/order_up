require 'rails_helper'

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

describe 'As a visitor' do
  describe "when I visit a dish's show page" do
    before :each do
      @chef1 = Chef.create({name: "Ralph"})
      @dish1 = @chef1.dishes.create({name: "pasta", description: "noodles and sauce"})
      @noodles = Ingredient.create({name: "noodles", calories: 100})
      @sauce = Ingredient.create({name: "sauce", calories: 80})
      @d1_noodles = DishIngredient.create({dish_id: @dish1.id, ingredient_id: @noodles.id})
      @d1_sauce = DishIngredient.create({dish_id: @dish1.id, ingredient_id: @sauce.id})
    end

    it "I see dish name/desc, its ingredients, and the chef's name" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Dish Name: #{@dish1.name}")
      expect(page).to have_content("Dish Description: #{@dish1.description}")
      expect(page).to have_content("Chef Name: #{@dish1.chef.name}")

      @dish1.ingredients.each do |ingredient|
        within("#ingredient-#{ingredient.id}") do
          expect(page).to have_content(ingredient.name)
        end
      end
    end
  end
end
