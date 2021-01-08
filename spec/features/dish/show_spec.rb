require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a dish's show page" do
    before :each do
      @chef_ryan = Chef.create!(name: 'Ryan')
      @pizza = @chef_ryan.dishes.create!(name: 'Pizza', description: 'Cheesy goodness')

      @dough = Ingredient.create!(name: 'Dough', calories: 100)
      @cheese = Ingredient.create!(name: 'Cheese', calories: 200)

      @pizza.dish_ingredients.create!(ingredient_id: @dough.id)
      @pizza.dish_ingredients.create!(ingredient_id: @cheese.id)

      visit "/dishes/#{@pizza.id}"
    end

    it "I see the dish’s name and description" do
      expect(page).to have_content("Name: #{@pizza.name}")
      expect(page).to have_content("Description: #{@pizza.description}")
    end

    it 'I see a list of ingredients for that dish' do
      within('.dish-ingredients') do
        expect(page).to have_content(@dough.name)
        expect(page).to have_content(@cheese.name)
      end
    end

    it "I see the chef's name" do
      expect(page).to have_content("Chef Name: #{@chef_ryan.name}")
    end

    it 'I see the total calorie count for that dish' do
      expect(page).to have_content("Total Dish Calories: #{@pizza.calorie_count}")
    end
  end
end
