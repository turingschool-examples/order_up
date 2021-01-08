require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'when i visit a show page' do
    it 'can display that dish name & description' do
      @chef = Chef.create!(name: "Bob")
      @curry = @chef.dishes.create!(name: "Curry", description: "Flavor!")
      @in1 = Ingredient.create!(name: "Flour", calories: 15)
      @in2 = Ingredient.create!(name: "egg", calories: 20)

      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 2)
      DishIngredient.create!(dish: @curry, ingredient: @in2, count: 1)

      visit chef_dish_path(@chef, @curry)

      within "#dish-#{@curry.id}" do
        expect(page).to have_content("Name: #{@curry.name}")
        expect(page).to have_content("About this dish: #{@curry.description}")
        expect(page).to have_content("Total Calories: #{@curry.total_calories}")
      end

      within "#ingredient-#{@in1.id}" do
        expect(page).to have_content("Name: #{@in1.name}")
        expect(page).to have_content("Calories: #{@in1.calories}")
      end

    end
  end
end
