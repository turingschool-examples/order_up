require 'rails_helper'

RSpec.describe 'When a user visits a dishes show page', type: :feature do
  before(:each) do
    @chef = Chef.create!(name: "Gordan Ramsey")
    @dish_1 = @chef.dishes.create!(name: "Burrito", description: "A simple bean and cheese burrito")
    @tortilla = Ingredient.create!(name: "Tortilla", calories: 200)
    @beans = Ingredient.create!(name: "Pinto Beans", calories: 150)
    @cheese = Ingredient.create!(name: "Sharp Chedder", calories: 175)
    DishIngredient.create!(dish: @dish_1, ingredient: @tortilla)
    DishIngredient.create!(dish: @dish_1, ingredient: @beans)
    DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
  end

  describe "As a visitor" do
    describe "When I visit a dish's show page" do
      it "Displays the dish's name and description" do
        visit dish_path(@dish_1.id)

        expect(page).to have_content("Burrito")
        expect(page).to have_content("A simple bean and cheese burrito")

        within(".dish-ingredients") do
          expect(page).to have_content("Ingredients!")

          expect(page).to have_content("Ingredient: Tortilla")
          expect(page).to have_content("Calories: 150")
          expect(page).to have_content("Ingredient: Pinto Beans")
          expect(page).to have_content("Calories: 150")
          expect(page).to have_content("Ingredient: Sharp Chedder")
          expect(page).to have_content("Calories: 175")
        end

        within(".chef-name") do
          expect(page).to have_content("Chef Name: Gordan Ramsey")
        end
        within(".calories") do
          expect(page).to have_content("Total Calories for Dish: 525")
        end
      end
    end
  end

end
