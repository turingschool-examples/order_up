require "rails_helper"

describe "As a visitor" do
  describe "When i visit a dish show page" do
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
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_4, ingredient_quantity: 1)
    end

    it "I see its attributes" do
      visit dish_path(@dish_1)

      within("#dish") do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content("Chef: #{@dish_1.chefs_name}")
        expect(page).to have_content("Calories: #{Dish.total_calories(@dish_1)}")
        within("#ingredients") do
          expect(page).to have_content("Ingredients:")
          expect(page).to have_content(@ingredient_1.name) 
          expect(page).to have_content(@ingredient_2.name) 
          expect(page).to have_content(@ingredient_3.name) 
        end 
      end
    end

  end
end
