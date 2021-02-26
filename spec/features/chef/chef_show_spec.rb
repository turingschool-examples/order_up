# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit a chef show page' do
    before(:each) do
      @chef1 = Chef.create(name: 'Tommy', id: 1)
      @dish1 = Dish.create(name: 'Pizza', description: 'You might hate yourself after, but damn if it is not delicious', chef_id: 1)
      @dish2 = Dish.create(name: 'Salad', description: 'You will not hate yourself after, but it is not as delicious as pizza. Just get pizza', chef_id: 1)
      @ingredient1 = Ingredient.create(name: 'Sauce', calories: 50)
      @ingredient2 = Ingredient.create(name: 'Dough', calories: 200)
      @ingredient3 = Ingredient.create(name: 'Cheese', calories: 100)
      @ingredient4 = Ingredient.create(name: 'Pepperoni', calories: 150)
      @ingredient5 = Ingredient.create(name: 'Lettuce', calories: 20)
      @ingredient6 = Ingredient.create(name: 'Carrots', calories: 50)
      @ingredient7 = Ingredient.create(name: 'Cucumber', calories: 50)
      @ingredient8 = Ingredient.create(name: 'Dressing', calories: 120)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient3)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient4)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient5)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient6)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient7)
      DishIngredient.create(dish: @dish2, ingredient: @ingredient8)
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
