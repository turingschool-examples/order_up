require 'rails_helper'
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
RSpec.describe 'As a visitor' do
  describe "when I visit a dish's show page" do
    before :each do
      @chef = Chef.create!(name: 'Phil')

      @dish = @chef.dishes.create!(name: 'Grilled Cheese', description: 'Gooey cheese bread')

      @ingredient_1 = Ingredient.create!(name: "Slice Smoked Cheddar", calories: 150)
      @ingredient_2 = Ingredient.create!(name: "2 Slices Sourdough Bread", calories: 200)
      @ingredient_3 = Ingredient.create!(name: "Tbs Butter", calories: 100)

      @dish_ingredient_1 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_1)
      @dish_ingredient_2 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_2)
      @dish_ingredient_3 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_3)

      visit "dishes/#{@dish.id}"
    end
    it "I see the dish's name and description" do

      expect(page).to have_content("#{@dish.name}")
      expect(page).to have_content("#{@dish.description}")
    end

    it "I see a list of ingredients for that dish" do
      expect(page).to have_content("Slice Smoked Cheddar")
      expect(page).to have_content("2 Slices Sourdough Bread")
      expect(page).to have_content("Tbs Butter")
    end
  end
end
