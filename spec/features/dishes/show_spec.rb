require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  before :each do
    @chef = Chef.create(name: "Chef")

    @dish_1 = @chef.dishes.create(name: "Dish 1", description: "Dish 1 description")

    @ingredient1 = Ingredient.create(name: "Ingredient 1", calories: 100)
    @ingredient2 = Ingredient.create(name: "Ingredient 2", calories: 20)
    @ingredient3 = Ingredient.create(name: "Ingredient 3", calories: 10)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient3.id)
  end

  describe "When I visit a dish show page " do
    it "See the dish name and description " do

      visit "/dishes/#{@dish_1.id}"
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)

    end

    it "See a list of ingredients and the chefs name " do

      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@chef.name)
      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@ingredient3.name}")
    end

    it "I see the total calorie count for that dish" do

      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Total Calories: 125")
    end
  end
end