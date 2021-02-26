# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
# Abd I see the total calorie count for that dish.

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit a dish show page' do
    before(:each) do
      @chef1 = Chef.create(name: 'Tommy', id: 1)
      @dish1 = Dish.create(name: 'Pizza', description: 'You might hate yourself after, but damn if it is not delicious', chef_id: 1)
      @ingredient1 = Ingredient.create(name: 'Sauce', calories: 50)
      @ingredient2 = Ingredient.create(name: 'Dough', calories: 200)
      @ingredient3 = Ingredient.create(name: 'Cheese', calories: 100)
      @ingredient4 = Ingredient.create(name: 'Pepperoni', calories: 150)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient3)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient4)
    end

    it "renders a button next to each ingredient to remove it" do
      visit "/dishes/#{@dish1.id}"
      click_button("Remove #{@ingredient4.name}")
      expect(page).to have_current_path("/dishes/#{@dish1.id}")
      expect(page).to_not have_content("#{@ingredient4.name}")
    end
  end
end
