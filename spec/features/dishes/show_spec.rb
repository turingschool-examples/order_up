require "rails_helper"

RSpec.describe "Dishes show page", type: :feature do
  describe "As a visitor" do
    before :each do
      @chef_1 = Chef.create!(name: "Richard Power")
      @chef_2 = Chef.create!(name: "Amma")

      @dish_1 = Dish.create!(name: "Pork and Brussels", description: "Delicious pork loin with cajun dry rub and sauteed brussels", chef_id: @chef_1)
      @dish_1 = Dish.create!(name: "Omelet", description: "Egg white omelet with goat cheese and sliced cherry tomatoes", chef_id: @chef_2)

      @ingredient_1 = Ingredient.create!(name: "pork loin", calories: "450")
      @ingredient_2 = Ingredient.create!(name: "marinade", calories: "5")
      @ingredient_3 = Ingredient.create!(name: "brussels", calories: "78")

      @ingredient_4 = Ingredient.create!(name: "egg whites", calories: "110")
      @ingredient_5 = Ingredient.create!(name: "goat cheese", calories: "193")
      @ingredient_6 = Ingredient.create!(name: "cherry tomatoes", calories: "23")

      IngredientsInDishes.create!(ingredient_id: @ingredient_1, dish_id: @dish_1)
      IngredientsInDishes.create!(ingredient_id: @ingredient_2, dish_id: @dish_1)
      IngredientsInDishes.create!(ingredient_id: @ingredient_3, dish_id: @dish_1)

      IngredientsInDishes.create!(ingredient_id: @ingredient_4, dish_id: @dish_2)
      IngredientsInDishes.create!(ingredient_id: @ingredient_5, dish_id: @dish_2)
      IngredientsInDishes.create!(ingredient_id: @ingredient_6, dish_id: @dish_2)
    end
    it "can see the dish's name, description, ingredients, and chef's name" do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@chef_1.name)
    end

  end
end
