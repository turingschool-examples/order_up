require "rails_helper"

describe 'As a visitor' do
  describe "When I visit a chef's ingredients index page" do
    before :each do
      @chef_1 = Chef.create!(name: "Mike Dao")
      @dish_1 = Dish.create!({name: "Pancakes", description: "Yummy, fluffy, buttery, goodness", chef_id: @chef_1.id})
      @dish_2 = Dish.create!({name: "Grilled Cheese", description: "Gooey cheesy amazingness", chef_id: @chef_1.id})
      @egg = Ingredient.create!(name: "egg", calories: 80)
      @butter = Ingredient.create!(name: "butter", calories: 90)
      @sugar = Ingredient.create!(name: "sugar", calories: 100)
      @cheese = Ingredient.create!(name: "cheese", calories: 150)
      @bread = Ingredient.create!(name: "bread", calories: 100)

      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @egg.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @butter.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @sugar.id})

      DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @butter.id})
      DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @bread.id})
      DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @cheese.id})
    end

    it "I see a list of all unique ingredients the chef uses" do
      visit "/chefs/#{@chef_1.id}/ingredients"

      expect(page).to have_content("#{@egg.name}")
      expect(page).to have_content("#{@butter.name}")
      expect(page).to have_content("#{@sugar.name}")
      expect(page).to have_content("#{@cheese.name}")
      expect(page).to have_content("#{@bread.name}")
    end
  end
end
