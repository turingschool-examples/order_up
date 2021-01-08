require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'when i visit a show page' do
    it 'can display that chef name & description' do
      @chef = Chef.create!(name: "Bob")
      @curry = @chef.dishes.create!(name: "Curry", description: "Flavor!")
      @pudding = @chef.dishes.create!(name: "Pudding", description: "Flavor!")
      @cake = @chef.dishes.create!(name: "Cake", description: "Flavor!")

      @in1 = Ingredient.create!(name: "Flour", calories: 15)
      @in2 = Ingredient.create!(name: "egg", calories: 20)
      @in3 = Ingredient.create!(name: "sugar", calories: 10)
      @in4 = Ingredient.create!(name: "chocolate", calories: 5)
      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 2)
      DishIngredient.create!(dish: @curry, ingredient: @in3, count: 1)
      DishIngredient.create!(dish: @curry, ingredient: @in2, count: 1)
      DishIngredient.create!(dish: @pudding, ingredient: @in1, count: 1)
      DishIngredient.create!(dish: @pudding, ingredient: @in3, count: 1)
      DishIngredient.create!(dish: @cake, ingredient: @in3, count: 1)

      visit chef_path(@chef)

      within "#headlines" do
        expect(page).to have_content("The Spectacular Chef #{@chef.name}!")
      end

      within ".my_dishes" do
        within "#dish-#{@curry.id}" do
          expect(page).to have_content("#{@curry.name}")
        end
        within "#dish-#{@pudding.id}" do
          expect(page).to have_content("#{@pudding.name}")
        end
      end

      within "#top_3" do
        within "#ingredient-#{@in3.id}" do
          expect(page).to have_content("#{@in3.name}")
        end
        within "#ingredient-#{@in1.id}" do
          expect(page).to have_content("#{@in1.name}")
        end
        within "#ingredient-#{@in2.id}" do
          expect(page).to have_content("#{@in2.name}")
        end

        expect(@in3.name).to appear_before(@in1.name)
        expect(@in1.name).to appear_before(@in2.name)
      end

      within ".navbar" do
        expect(page).to have_link("My Ingredients")
        click_link "My Ingredients"

        expect(current_path).to eq(chef_ingredients_path(@chef))
      end
    end
  end
end
