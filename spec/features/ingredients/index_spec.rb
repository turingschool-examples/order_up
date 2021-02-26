require 'rails_helper'

RSpec.describe 'Ingredients index page' do
  before :each do
    set_up
  end

  describe 'chef ingredient index page' do
    it 'has unique list of all the chef ingredients' do
      visit "/chefs/#{@jon.id}/ingredients"

      expect(page).to have_content("#{@jon.name}'s Ingredients")

      within ".ingredient-#{@salmon.id}" do
        expect(page).to have_content(@salmon.name)
      end

      within ".ingredient-#{@potatoes.id}" do
        expect(page).to have_content(@potatoes.name)
      end
    end
  end

  def set_up
    @jon = Chef.create!(name: "Jon Favreau")
    @fish = @jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
    @salmon = Ingredient.create!(name: "Salmon", calories: 250)
    @potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
    DishIngredient.create!(dish: @fish, ingredient: @salmon)
    DishIngredient.create!(dish: @fish, ingredient: @potatoes)
  end
end
