require "rails_helper"

RSpec.describe "Chefs show page", type: :feature do
  describe "As a visitor" do
    before :each do
      @chef_1 = Chef.create!(name: "Richard Power")
      @chef_2 = Chef.create!(name: "Amma")

      @dish_1 = Dish.create!(name: "Pork and Brussels", description: "Delicious pork loin with cajun dry rub and sauteed brussels", chef_id: @chef_1.id)
      @dish_2 = Dish.create!(name: "Omelet", description: "Egg white omelet with goat cheese and sliced cherry tomatoes", chef_id: @chef_2.id)

      @ingredient_1 = Ingredient.create!(name: "pork loin", calories: "450")
      @ingredient_2 = Ingredient.create!(name: "marinade", calories: "5")
      @ingredient_3 = Ingredient.create!(name: "brussels", calories: "78")

      @ingredient_4 = Ingredient.create!(name: "egg whites", calories: "110")
      @ingredient_5 = Ingredient.create!(name: "goat cheese", calories: "193")
      @ingredient_6 = Ingredient.create!(name: "cherry tomatoes", calories: "23")

      DishIngredient.create!(ingredient_id: @ingredient_1.id, dish_id: @dish_1.id)
      DishIngredient.create!(ingredient_id: @ingredient_2.id, dish_id: @dish_1.id)
      DishIngredient.create!(ingredient_id: @ingredient_3.id, dish_id: @dish_1.id)

      DishIngredient.create!(ingredient_id: @ingredient_4.id, dish_id: @dish_2.id)
      DishIngredient.create!(ingredient_id: @ingredient_5.id, dish_id: @dish_2.id)
      DishIngredient.create!(ingredient_id: @ingredient_6.id, dish_id: @dish_2.id)
    end
    it "can see name of chef, link to ingredients" do
      visit "/chefs/#{@chef_1.id}"
      expect(page).to have_content(@chef_1.name)
      expect(page).to have_link("See this Chef's Ingredients")
      click_link "See this Chef's Ingredients"
      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)

      expect(page).to_not have_content(@ingredient_4.name)
    end
  end
end
