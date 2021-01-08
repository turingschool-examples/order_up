require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a dish show page' do
    before :each do
      @chef_1 = Chef.create(name: 'Gordon Rembsy')
      @dish_1 = @chef_1.dishes.create!(name: 'Beef Wellington', description: 'Pastry heaven wrapped in bacon')
      @ingredient_1 = Ingredient.create(name: 'Beef', calories: 300)
      @ingredient_2 = Ingredient.create(name: 'Bacon', calories: 350)
      @ingredient_3 = Ingredient.create(name: 'Pastry', calories: 250)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
      @chef_2 = Chef.create(name: 'Rachel Ray')
      @dish_2 = @chef_2.dishes.create!(name: 'Lemon Risotto', description: 'Cheesy and zasty')
      @ingredient_4 = Ingredient.create(name: 'Arborio Rice', calories: 100)
      @ingredient_5 = Ingredient.create(name: 'Parmesan Cheese', calories: 200)
      @ingredient_6 = Ingredient.create(name: 'Lemon', calories: 10)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_6.id)
    end
    # it 'Shows me the dish name and description, list of ingredients and chefs name' do
    #   visit dish_path(@dish_1)
    #
    #   expect(page).to have_content(@dish_1.name)
    #   expect(page).to_not have_content(@dish_2.name)
    #   expect(page).to have_content(@dish_1.description)
    #   expect(page).to have_link(@dish_1.chef.name)
    #
    #   within(".dish_ingredients") do
    #   expect(page).to have_link(@ingredient_1.name)
    #   expect(page).to have_link(@ingredient_2.name)
    #   expect(page).to have_link(@ingredient_3.name)
    #   expect(page).to have_link(@chef_1.name)
    #   end
    # end
    it 'Shows the dish total calories' do
      visit dish_path(@dish_1)

      expect(page).to have_content(@dish_1.total_calories)
    end
  end
end
