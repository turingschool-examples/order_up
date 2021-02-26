require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a dish's show page" do
    before(:each) do
      chef1 = Chef.create(name: "Brisa")

      @dish_1 = @chef1.dishes.create!(name: "Dish 1", description: "Umami")
      # @dish_2 = Dish.create!(name: "Dish 2", description: "Sweet")
      # @dish_3 = Dish.create!(name: "Dish 3", description: "Spicy")

      @ingredient_1 = Ingredient.create!(name: "one", calories: 18)
      @ingredient_2 = Ingredient.create!(name: "two", calories: 37)
      @ingredient_3 = Ingredient.create!(name: "three", calories: 290)
      @ingredient_4 = Ingredient.create!(name: "four", calories: 120)
      @ingredient_5 = Ingredient.create!(name: "five", calories: 2)

      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1, ingredient_quantity: 4)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2, ingredient_quantity: 1)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5, ingredient_quantity: 27)

      # DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3, ingredient_quantity: 6)
      # DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4, ingredient_quantity: 12)
      # DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5, ingredient_quantity: 9)
      #
      # DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_1, ingredient_quantity: 1)
      # DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_2, ingredient_quantity: 8)
      # DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_4, ingredient_quantity: 1)
      # DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_5, ingredient_quantity: 20)

    end

    it "shows the dish’s name and description" do
      visit dish_path(@dish_1)

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
    end

    it "list ingredients for that dish" do
      within ("#ingredients - #{@dish_1.name}") do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_5.name)
      end
    end

    it "And I see the chef's name" do
      within ("#dish- #{@dish_1.name}") do
        expect(page).to have_content(@dish_1.chefs_name)
      end
    end

    it "And I see the total calorie count for that dish." do
      within ("#dish - #{@dish_1.name}") do
        expect(page).to have_content(@dish_1.total_calories)
      end
    end
  end
end
