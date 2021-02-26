require 'rails_helper'

RSpec.describe 'Chef ingredients index page' do
  before :each do
    Ingredient.destroy_all
    Dish.destroy_all
    DishIngredient.destroy_all
    Chef.destroy_all
    @chef = Chef.create(name: 'Chef 1')
    @dish1 = @chef.dishes.create(name: 'Dish 1', description: 'dish description')
    @dish2 = @chef.dishes.create(name: 'Dish 2', description: 'dish2 description')
    @ingredient1 = Ingredient.create(name: 'Chicken', calories: 100)
    @ingredient2 = Ingredient.create(name: 'Rice', calories: 200)
    @ingredient3 = Ingredient.create(name: 'Beef', calories: 150)
    @dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
    @dish_ingredient4 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
  end

  describe 'As a visitor' do
    describe "When I visit a chef's show page" do
      describe "And I see a link to view a list of all ingredients that this chef uses in their dishes" do
        describe "When I click on that link, I'm taken to a chef's ingredient index page" do
          it "and I can see a unique list of names of all the ingredients that this chef uses" do
            visit chef_path(@chef)

            expect(page).to have_link("All Ingredients")

            click_link("All Ingredients")

            expect(current_path).to eq(chef_ingredients_path(@chef))

            expect(page).to have_content(@ingredient1.name)
            expect(page).to have_content(@ingredient2.name)
            expect(page).to have_content(@ingredient3.name)
          end
        end
      end
    end
  end
end
