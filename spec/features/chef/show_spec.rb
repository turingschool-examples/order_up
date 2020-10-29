require 'rails_helper'

RSpec.describe "As a visitor," do 
  describe "when I visit '/chef/:id'" do 
    it "I see the name of the chef and a link to view a list of all ingredients
    that this chef uses in their dishes." do
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

      visit "/chef/#{@chef_1.id}"
      expect(page).to have_content("#{@chef_1.name}")
      expect(page).to have_link("All Ingredients")
      end

      it "When I click this link, I am taken to /chef/:id/ingredients and
      I see a unique list of names of all the ingredients that they use." do
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

      visit "/chef/#{@chef_1.id}"
      click_link "All Ingredients"
      expect(page).to have_content("testingredient1")
      expect(page).to have_content("testingredient2")
      end
    end
  end