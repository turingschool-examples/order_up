require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do
  describe 'as a visitor' do
    before(:each) do
      @chef = Chef.create!(name: "Claire Saffitz")

      @flour = Ingredient.create!(name: "Flour", calories: 500)
      @yeast = Ingredient.create!(name: "Yeast", calories: 0)
      @salt = Ingredient.create!(name: "Salt", calories: 10)
      @evoo = Ingredient.create!(name: "Olive Oil", calories: 250)
      @apple = Ingredient.create!(name: "Apple", calories: 400)
      @sugar = Ingredient.create!(name: "Sugar", calories: 200)
      
      @dish_1 = @chef.dishes.create!(name: "Soft & Crispy Focaccia", description: "Lots of olive oil.")
      DishIngredient.create!(dish: @dish_1, ingredient: @flour)
      DishIngredient.create!(dish: @dish_1, ingredient: @yeast)
      DishIngredient.create!(dish: @dish_1, ingredient: @salt)
      DishIngredient.create!(dish: @dish_1, ingredient: @evoo)
      
      @dish_2 = @chef.dishes.create!(name: "Apple Pie", description: "Lots of apples.")
      DishIngredient.create!(dish: @dish_2, ingredient: @apple)
      DishIngredient.create!(dish: @dish_2, ingredient: @salt)
      DishIngredient.create!(dish: @dish_2, ingredient: @sugar)
      DishIngredient.create!(dish: @dish_2, ingredient: @flour)
      
      @dish_3 = @chef.dishes.create!(name: "Sourdough Boule", description: "Lots of sour.")
      DishIngredient.create!(dish: @dish_3, ingredient: @flour)
      DishIngredient.create!(dish: @dish_3, ingredient: @yeast)
      DishIngredient.create!(dish: @dish_3, ingredient: @salt)
    end

    it 'i see the chef name and a link to view list of ingredients they use that takes me to ingredient index page' do
      visit chef_path(@chef)

      expect(page).to have_content(@chef.name)
      expect(page).to have_link("View Ingredients #{@chef.name} Uses", href: chef_ingredients_path(@chef))

      click_on "View Ingredients #{@chef.name} Uses"

      expect(current_path).to eq(chef_ingredients_path(@chef))
    end

    it 'i see the three most popular ingredients that the chef uses in their dishes' do
      visit chef_path(@chef)

      within("#top-3-ingredients") do
        expect(page).to have_content(@flour.name)
        expect(page).to have_content(@yeast.name)
        expect(page).to have_content(@salt.name)
      end
    end
  end
end