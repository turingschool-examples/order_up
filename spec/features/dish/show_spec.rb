require 'rails_helper'

RSpec.describe 'dish show page' do
    before(:each) do
      @chef = Chef.create(name: "Bobby Flay")
      @dish_1 = @chef.dishes.create(name: "Cheese Burger", description: "Delicious")
      @cheese = Ingredient.create(name: "American cheese", calories: 100)
      @beef = Ingredient.create(name: "beef", calories: 200)
      DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
      DishIngredient.create!(dish: @dish_1, ingredient: @beef)
    end

    it "can show dish name and description" do
      visit chef_dish_path(@chef, @dish_1)
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@chef.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@beef.name)
      expect(page).to have_content("300 calories")
  end

  it " I see a button to remove an ingredient from a dish" do
      visit chef_dish_path(@chef, @dish_1)
      remove = first(:button, "Remove Ingredient")
      expect(page).to have_content(@cheese.name)
      remove.click
      expect(page).not_to have_content(@cheese.name)
  end
end
