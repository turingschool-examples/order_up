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
      @ingredient1 = Ingredient.create(name: 'Sauce', calories: 50)
      @ingredient2 = Ingredient.create(name: 'Dough', calories: 200)
      @ingredient3 = Ingredient.create(name: 'Cheese', calories: 100)
      @ingredient4 = Ingredient.create(name: 'Pepperoni', calories: 150)
      @ingredient5 = Ingredient.create(name: 'Olive Oil', calories: 300)
      @ingredient6 = Ingredient.create(name: 'Bacon', calories: 200)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient1)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient2)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient3)
      DishIngredient.create(dish: @dish1, ingredient: @ingredient4)
    end

    it "displays a link to see the chef's ingredients" do
      visit "/chefs/#{@chef1.id}"

      expect(page).to have_link("Chef's ingredients")
    end

    describe "when I click on that link" do
      it "takes me to the chef ingredient index, where I see a list of the ingredients the chef uses" do
        visit "/chefs/#{@chef1.id}"
        click_link("Chef's ingredients")
        expect(page).to have_current_path("/chefs/#{@chef1.id}/ingredients")
        expect(page).to have_content("#{@ingredient1.name}")
        expect(page).to have_content("#{@ingredient2.name}")
        expect(page).to have_content("#{@ingredient3.name}")
        expect(page).to have_content("#{@ingredient4.name}")
        expect(page).to_not have_content("#{@ingredient5.name}")
        expect(page).to_not have_content("#{@ingredient6.name}")
      end
    end
  end
end
