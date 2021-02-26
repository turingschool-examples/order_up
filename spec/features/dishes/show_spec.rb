require 'rails_helper'

RSpec.describe 'Dish show page' do
  before :each do
    chef = Chef.create!(name: 'Guy Fieri')
    chef.dishes.create!(name: 'Burger', description: 'A classic.')
    @dish = chef.dishes.first
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

    xit "shows list of dish's ingredients" do
      visit dish_path(@dish)
    end

    xit "shows dish's calorie count" do
      visit dish_path(@dish)
    end
  end
end
