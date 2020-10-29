require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  describe 'As a visitor' do
    before :each do
      @murray = Chef.create!(name: 'Murray McMasterful')
      @spaghetti = @murray.dishes.create!(name: 'Spaghetti', description: 'Delish!')
      @pasta = @spaghetti.ingredients.create!(name: 'Rigitoni', calories: 10)
      @sauce = @spaghetti.ingredients.create!(name: 'Red Sauce', calories: 50)
      @salt = @spaghetti.ingredients.create!(name: 'Salt', calories: 5)
    end
    it 'can see the name and description of the dish' do
      visit "/dishes/#{@spaghetti.id}"

      expect(page).to have_content("#{@spaghetti.name}'s Homepage")
      expect(page).to have_content("Description: #{@spaghetti.description}")

      expect(page).to have_content("#{@spaghetti.name}'s ingredients:")
      within "#ingredients" do
        @spaghetti.ingredients.each do |ingredient|
            expect(page).to have_content(ingredient.name)
        end
      end
      expect(page).to have_content("Created by: #{@spaghetti.chef.name}")
    end
  end
end
