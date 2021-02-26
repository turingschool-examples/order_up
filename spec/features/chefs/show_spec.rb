require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do
    set_up
  end

  describe "visit chefs show page" do
    it 'visit chefs show page and i see chef name and a link to their ingredients' do
      visit "/chefs/#{@jon.id}"

      expect(page).to have_content("#{@jon.name}")
      expect(page).to have_link("Chef's Ingredients")
    end

    it 'the chef ingredients link takes me to the chef ingrerdients index' do
      visit "/chefs/#{@jon.id}"

      click_link("Chef's Ingredients")
      expect(current_path).to eq("/chefs/#{@jon.id}/ingredients")
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
