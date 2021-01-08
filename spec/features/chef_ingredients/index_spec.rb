require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a chef ingredients index page" do
    before :each do
      @chef_ryan = Chef.create!(name: 'Ryan')
      @pizza = @chef_ryan.dishes.create!(name: 'Pizza', description: 'Cheesy goodness')

      @dough = Ingredient.create!(name: 'Dough', calories: 100)
      @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
      @anchovy = Ingredient.create!(name: 'Anchovy', calories: 150)

      @pizza.dish_ingredients.create!(ingredient_id: @dough.id)
      @pizza.dish_ingredients.create!(ingredient_id: @cheese.id)

      visit "/chefs/#{@chef_ryan.id}/ingredients"
    end

    it 'I can see a unique list of names of all the ingredients that this chef uses' do
      expect(page).to have_content(@dough.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to_not have_content(@anchovy.name)
    end
  end
end
