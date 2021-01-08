require "rails_helper"

describe "As a visitor" do
  describe "When i visit a chef ingredients index" do
    before :each do
      @bob = Chef.create!(name: "Bob")

      @dish_1 = @bob.dishes.create!(name: "Dish 1", description: "particularly delicious")
      @dish_2 = @bob.dishes.create!(name: "Dish 2", description: "xtra delicious")
      @dish_3 = @bob.dishes.create!(name: "Dish 3", description: "massive delicious")
      
      @ingredient_1 = Ingredient.create!(name: "A", calories: 20)
      @ingredient_2 = Ingredient.create!(name: "B", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "C", calories: 30)
      @ingredient_4 = Ingredient.create!(name: "D", calories: 50)
      
      Recipe.create!(dish: @dish_1, ingredient: @ingredient_1, ingredient_quantity: 2)
      Recipe.create!(dish: @dish_1, ingredient: @ingredient_2, ingredient_quantity: 1)
      Recipe.create!(dish: @dish_1, ingredient: @ingredient_3, ingredient_quantity: 3)
      
      Recipe.create!(dish: @dish_2, ingredient: @ingredient_1, ingredient_quantity: 2)
      Recipe.create!(dish: @dish_2, ingredient: @ingredient_2, ingredient_quantity: 1)
      
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_1, ingredient_quantity: 1)
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_2, ingredient_quantity: 1)
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_3, ingredient_quantity: 1)
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_3, ingredient_quantity: 1)
    end
    it 'I see the chefs ingredients used' do
      visit chef_chef_ingredients_path(@bob)

      expect(page).to have_content("#{@bob.name}'s Ingredients")
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to_not have_content(@ingredient_4.name)
    end
  end
end