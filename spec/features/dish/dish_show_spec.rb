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
    it "displays the dish name and description" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("#{@dish1.name}")
      expect(page).to have_content("#{@dish1.description}")
    end

    it "displays a list of the ingredients in that dish" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
      expect(page).to have_content("#{@ingredient3.name}")
      expect(page).to have_content("#{@ingredient4.name}")
    end

    it "displays the chef's name" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Prepared by: #{@chef1.name}")
    end

    it "displays the total calories count for that dish" do
      visit "/dishes/#{@dish1.id}"

      expect(page).to have_content("Total calories: #{@dish1.ingredients.sum(:calories)}")
    end
  end
end
