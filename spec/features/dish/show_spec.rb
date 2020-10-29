require 'rails_helper'

RSpec.describe "As a visitor," do 
  describe "when I visit '/dish/:id'" do 
    it "I see that dishes name and description and a list of 
        ingredients for that dish and the chef name." do
      @chef_1 = Chef.create!(
        name: "TestChef1")
      @dish_1 = Dish.create!(
        name: "TestDish1",
        description:  "TestDescription1",
        chef_id: "#{@chef_1.id}")
      @ingredient_1 = Ingredient.create!(
        name: "testingredient1",
        calories: 200)
      @ingredient_2 = Ingredient.create!(
        name: "testingredient2",
        calories: 400)
      @ingredient_dish_1 = IngredientDish.create!(
        ingredient_id: "#{@ingredient_1.id}",
        dish_id: "#{@dish_1.id}")
      @ingredient_dish_2 = IngredientDish.create!(
        ingredient_id: "#{@ingredient_2.id}",
        dish_id: "#{@dish_1.id}")

      visit "/dish/#{@dish_1.id}"

      expect(page).to have_content("#{@dish_1.name}")
      expect(page).to have_content("#{@dish_1.description}")
      expect(page).to have_content("testingredient1")
      expect(page).to have_content("testingredient2")
      expect(page).to have_content("#{@dish_1.chef.name}")
      expect(page).to have_content("#{@dish_1.calorie_count}")

      end
    end
  end