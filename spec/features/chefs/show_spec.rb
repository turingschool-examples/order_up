require 'rails_helper'

describe 'Chef show page' do
  describe 'user visits a chefs show page' do

    before :each do
      @chef = Chef.create!(name: 'Tom')
      @dish = @chef.dishes.create!(name: 'Pasta', description: 'Yummy')
      @ingredient1 = Ingredient.create!(name: 'pasta', calories: 5000)
      @ingredient2 = Ingredient.create!(name: 'salt', calories: 10)
      @dish_ingredient1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient1.id)
      @dish_ingredient2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient2.id)

      visit "/chefs/#{@chef.id}"
    end

    it 'see name of chef and a link to view list of ingredients they use' do
      expect(page).to have_content(@chef.name)
      expect(page).to have_link("See all ingredients")
    end

    it 'can click ingredient link and are taken to chefs ingredient index page' do

    end 
  end
end
