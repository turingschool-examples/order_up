require 'rails_helper'

describe 'Dish show page' do
  describe 'user visits a dish show page' do

    before :each do
      @chef = Chef.create!(name: 'Tom')
      @dish = @chef.dishes.create!(name: 'Pasta', description: 'Yummy')
      @ingredient1 = Ingredient.create!(name: 'pasta', calories: 5000)
      @ingredient2 = Ingredient.create!(name: 'salt', calories: 10)
      @dish_ingredient1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient1.id)
      @dish_ingredient2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient2.id)

      visit "/dishes/#{@dish.id}"
    end

    it 'you see dish name and description' do
      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it 'you see the list of ingredients and the chefs name' do
      expect(page).to have_content("List of Ingredients:")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient1.calories)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient2.calories)
      expect(page).to have_content("Chef:")
      expect(page).to have_content(@chef.name)
    end

    it 'you see total calorie count for dish' do
      expect(page).to have_content("Total Calories:")
      expect(page).to have_content('5010')
    end
  end
end
