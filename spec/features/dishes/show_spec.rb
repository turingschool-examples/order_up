require 'rails_helper'

RSpec.describe 'Dish show page' do
  before :each do
    chef = Chef.create!(name: 'Guy Fieri')
    @dish = chef.dishes.create!(name: 'Burger', description: 'A classic.')
    @bun = Ingredient.create!(name: 'Bun', calories: 10)
    @meat = Ingredient.create!(name: 'Meat', calories: 50)
    @dish.ingredients << @bun
    @dish.ingredients << @meat
  end

  describe 'as a visitor' do
    it 'shows dish name, description and chef' do
      visit dish_path(@dish)

      within('#dish-info') do
        expect(page).to have_content('Burger')
        expect(page).to have_content('A classic.')
        expect(page).to have_content('Guy Fieri')
      end
    end

    it "shows dish's calorie count" do
      visit dish_path(@dish)

      within('#dish-info') do
        expect(page).to have_content('60')
      end
    end

    it "shows list of dish's ingredients" do
      visit dish_path(@dish)

      within('#ingredients') do
        expect(page).to have_content('Bun')
        expect(page).to have_content('Meat')
      end
    end

    it 'shows delete button for each dish ingredient' do
      visit dish_path(@dish)

      within('#ingredients') do
        expect(page).to have_button("delete-ingredient-#{@bun.id}")
        expect(page).to have_content("delete-ingredient-#{@meat.id}")
      end
    end
  end
end
