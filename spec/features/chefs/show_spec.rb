require 'rails_helper'

describe 'As a visitor' do
  describe 'When a visit a chef show page' do
    before :each do
      @chef_1 = Chef.create(name: 'Gordon Rembsy')
      @dish_1 = @chef_1.dishes.create!(name: 'Beef Wellington', description: 'Pastry heaven wrapped in bacon')
      @ingredient_1 = Ingredient.create(name: 'Beef', calories: 300)
      @ingredient_2 = Ingredient.create(name: 'Bacon', calories: 350)
      @ingredient_3 = Ingredient.create(name: 'Pastry', calories: 250)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
      @dish_2 = @chef_1.dishes.create!(name: 'Lemon Risotto', description: 'Cheesy and zasty')
      @ingredient_4 = Ingredient.create(name: 'Arborio Rice', calories: 100)
      @ingredient_5 = Ingredient.create(name: 'Parmesan Cheese', calories: 200)
      @ingredient_6 = Ingredient.create(name: 'Lemon', calories: 10)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_6.id)
    end
    it 'Shows the name of the chef and links to all ingredients for all dishes' do
      visit chef_path(@chef_1)

      expect(page).to have_content(@chef_1.name)
      expect(page).to have_link(@ingredient_1.name)
      expect(page).to have_link(@ingredient_2.name)
      expect(page).to have_link(@ingredient_3.name)
      expect(page).to have_link(@ingredient_4.name)
      expect(page).to have_link(@ingredient_5.name)
      expect(page).to have_link(@ingredient_6.name)
    end
  end
end
