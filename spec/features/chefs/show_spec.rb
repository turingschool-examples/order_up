require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a chef's show page" do
    before :each do
      chef1 = Chef.create(name: "Brisa")

      # @dish_1 = @chef1.dishes.create!(name: "Dish 1", description: "Umami")
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

    it "shows the name of that chef and a link to view all ingredients that this chef uses in their dish" do
      visit chef_path(@chef1)

      within("#chef") do
        expect(page).to have_content(@chef1.name)
        expect(page).to have_link("#{@chef1.name}'s Ingredients")
      end
    end

    it "When i click on that link, I am taken to chef ingredient index page" do
      click_link("#{@chef1.name}'s Ingredients")

      expect(current_path).to eq(chef_chef_ingredients(@chef1))
    end
  end
end
