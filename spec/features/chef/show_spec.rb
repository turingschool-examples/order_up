require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  describe 'As a visitor' do
    before :each do
      @murray = Chef.create!(name: 'Murray McMasterful')
      @spaghetti = @murray.dishes.create!(name: 'Spaghetti', description: 'Delish!')
      @pasta = @spaghetti.ingredients.create!(name: 'Rigitoni', calories: 10)
      @sauce = @spaghetti.ingredients.create!(name: 'Red Sauce', calories: 50)
      @salt = @spaghetti.ingredients.create!(name: 'Salt', calories: 5)

      @chicken_madiera = @murray.dishes.create!(name: 'Chicken Madiera', description: 'Savory')
      @chicken = @chicken_madiera.ingredients.create!(name: 'Chicken', calories: 100)
      @mash = @chicken_madiera.ingredients.create!(name: 'Mash', calories: 300)
      @madiera = @chicken_madiera.ingredients.create!(name: 'madiera', calories: 200)

    end
    it 'can see the name of the Chef' do
      visit "/chefs/#{@murray.id}"

      expect(page).to have_content("#{@murray.name}'s Homepage")
      expect(page).to have_link('All my ingredients')
      click_link('All my ingredients')

      expect(current_path).to eq("/chefs/#{@murray.id}/ingredients")

      expect(page).to have_content('All my Ingredients!')

      @murray.ingredients.unique_ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end

    end
  end
end
