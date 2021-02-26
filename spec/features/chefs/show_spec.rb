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

    it 'show page has the chefs most popular dishes' do
      visit "/chefs/#{@jon.id}"

      expect(page).to have_content("Chef's Three Most Popular Dishes:")

      within ".ingredient-#{@potatoes.id}" do
        expect(page).to have_content(@potatoes.name)
      end

      within ".ingredient-#{@pork.id}" do
        expect(page).to have_content(@pork.name)
      end

      within ".ingredient-#{@salmon.id}" do
        expect(page).to have_content(@salmon.name)
      end
    end
  end

  def set_up
    @jon = Chef.create!(name: "Jon Favreau")
    @fish = @jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
    @cuban = @jon.dishes.create!(name: "Cuban Sandwich", description: "My specialty")
    @tacos = @jon.dishes.create!(name: "Street Tacos", description: "A taste of mexico")
    @salmon = Ingredient.create!(name: "Salmon", calories: 250)
    @potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
    @bread = Ingredient.create!(name: "Bread", calories: 300)
    @pork = Ingredient.create!(name: "Pork", calories: 225)
    DishIngredient.create!(dish: @fish, ingredient: @salmon)
    DishIngredient.create!(dish: @fish, ingredient: @potatoes)
    DishIngredient.create!(dish: @cuban, ingredient: @potatoes)
    DishIngredient.create!(dish: @cuban, ingredient: @bread)
    DishIngredient.create!(dish: @cuban, ingredient: @pork)
    DishIngredient.create!(dish: @tacos, ingredient: @pork)
    DishIngredient.create!(dish: @tacos, ingredient: @potatoes)
  end
end
