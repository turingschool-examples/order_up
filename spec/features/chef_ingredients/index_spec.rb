require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'when i visit a show page' do
    it 'can display that chef name & description' do
      @chef = Chef.create!(name: "Bob")
      @curry = @chef.dishes.create!(name: "Curry", description: "Flavor!")
      @in1 = Ingredient.create!(name: "Flour", calories: 15)
      @in2 = Ingredient.create!(name: "egg", calories: 20)
      @in3 = Ingredient.create!(name: "sugar", calories: 10)
      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 2)
      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 2)
      DishIngredient.create!(dish: @curry, ingredient: @in2, count: 1)

      visit chef_ingredients_path(@chef)

      within "#ingredient-#{@in1.id}" do
        expect(page).to have_content("#{@in1.name}")
        expect(page).to have_content("#{@in1.calories}")
      end

      within "#ingredient-#{@in2.id}" do
        expect(page).to have_content("#{@in2.name}")
        expect(page).to have_content("#{@in2.calories}")
      end

      expect(page).to_not have_content("#{@in3.name}")
      expect(page).to_not have_content("#{@in3.calories}")
    end
  end
end
