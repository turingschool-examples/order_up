require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
  describe "I am taken to a chefs ingredients page" do
    before(:each) do
      chef1 = Chef.create!(name: "Brisa")

      @dish_1 = @chef1.dishes.create!(name: "Dish 1", description: "Umami")
      @dish_2 = @chef1.dishes.create!(name: "Dish 2", description: "Sweet")

      @ingredient_1 = Ingredient.create!(name: "one", calories: 18)
      @ingredient_2 = Ingredient.create!(name: "two", calories: 37)
      @ingredient_3 = Ingredient.create!(name: "three", calories: 290)
      @ingredient_4 = Ingredient.create!(name: "four", calories: 120)
      @ingredient_5 = Ingredient.create!(name: "five", calories: 2)

      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1, quantity: 4)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2, quantity: 1)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5, quantity: 27)

      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3, quantity: 6)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4, quantity: 12)
      DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5, quantity: 9)
    end

    it "shows a unique list of names of all the ingredients that this chef uses" do
      visit chef_chef_ingredients_path(@chef1)
      binding.pry

      expect(page).to have_content("#{@chef1.name}'s Ingredients")
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_5.name)
      expect(page).to have_content(@ingredient_5.name)
    end
  end
end
