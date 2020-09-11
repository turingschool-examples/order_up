require 'rails_helper'

RSpec.describe "Dishes Show Page Spec" do
  describe "As a visitor" do
    describe "When I visit a dish's show page" do
      before :each do
        @chef = Chef.create(name: "Chef Boyardee")
        @ravioli = @chef.dishes.create(name: "Ravioli", description: "I mean it's Chef Boyardee")

        @pasta = Ingredient.create(name: "Pasta", quantity: 2, units: "cups", calories_per_unit: 120)
        @sausage = Ingredient.create(name: "Sausage", quantity: 4, units: "cups", calories_per_unit: 320)
        @sauce = Ingredient.create(name: "Sauce", quantity: 5, units: "cups", calories_per_unit: 200)

        @ravioli_ingredients = [@pasta, @sausage, @sauce]
        @ravioli.ingredients << @ravioli_ingredients

        visit dish_path(@ravioli)
      end

      it "There is a list of ingredientsfor that dish" do
        within ".#{@ravioli.name.downcase}-ingredients" do
          expect(page).to have_content("#{@ravioli.name} Ingredients:")
          expect(page).to have_content("#{@pasta.name}")
          expect(page).to have_content("#{@sausage.name}")
          expect(page).to have_content("#{@sauce.name}")
        end
      end

      it "there is the chef's name" do
        expect(page).to have_content("#{@ravioli.name}, by Chef #{@chef.name}")
      end
      it "there is the total calorie count for that dish" do
        within(".#{@ravioli.name.downcase}-ingredients") do
          expect(page).to have_content("Total Calories: #{@ravioli.total_calories}")
        end
      end
    end
  end
end
