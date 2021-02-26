require 'rails_helper'

RSpec.describe 'Dish show page' do
  before :each do
    @chef = Chef.create(name: 'Chef 1')
    @dish1 = @chef.dishes.create(name: 'Dish 1', description: 'dish description')
    @dish2 = @chef.dishes.create(name: 'Dish 2', description: 'dish2 description')
    @ingredient1 = Ingredient.create(name: 'Chicken', calories: 100)
    @ingredient2 = Ingredient.create(name: 'Rice', calories: 200)
    @ingredient3 = Ingredient.create(name: 'Beef', calories: 150)
    @dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
  end

  describe 'As a visitor' do
    describe "When I visit a dish's show page" do
      it "I see the dish’s name and description" do
        visit dish_path(@dish1)

        expect(current_path).to eq ("/dishes/#{@dish1.id}")
        expect(page).to have_content(@dish1.name)
        expect(page).to have_content(@dish1.description)

        expect(page).to_not have_content(@dish2.name)
        expect(page).to_not have_content(@dish2.description)
      end
      it "And I see a list of ingredients for that dish" do
        visit dish_path(@dish1)
        within ".dish-ingredients" do

          expect(page).to have_content("Ingredients:")

          within ".ingredient-#{@ingredient1.id}" do
            expect(page).to have_content(@ingredient1.name)
          end
          within ".ingredient-#{@ingredient2.id}" do
            expect(page).to have_content(@ingredient2.name)
          end
        end
      end
      it "And I see the chef's name" do
        visit dish_path(@dish1)

        within ".chef" do
          expect(page).to have_content("Chef: #{@chef.name}")
        end
      end
      it "And I see the total calorie count for that dish." do
        visit dish_path(@dish1)
      end
    end
  end
end
