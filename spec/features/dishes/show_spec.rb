require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before(:each) do
    @chef = Chef.create(name: "Chef")

    @mac_cheese = @chef.dishes.create(name: "Mac and Cheese", description: "Cheesy Goodness")
    @pizza = @chef.dishes.create(name: "Pizza", description: "Even when its bad its good")

    @mac = Ingredient.create(name: "Mac", calories: 100)
    @cheese = Ingredient.create(name: "Cheese", calories: 150)
    @dough = Ingredient.create(name: "Pizza Dough", calories: 200)
    @sauce = Ingredient.create(name: "Pizza Sauce", calories: 50)

    @mac_cheese.ingredients << [@mac, @cheese]
    @pizza.ingredients << [@dough, @cheese, @sauce]
  end
  describe "As a visitor" do
    it "shows the dish's name and description" do
      visit dish_path(@mac_cheese)
      
      expect(page).to have_content(@mac_cheese.name)
      expect(page).to have_content(@mac_cheese.description)
    end
    
    it "shows a list of ingredients for that dish" do
      visit dish_path(@mac_cheese)
      
      within("#ingredient-#{@mac.id}") do
        expect(page).to have_content(@mac.name)
      end
      
      within("#ingredient-#{@cheese.id}") do
        expect(page).to have_content(@cheese.name)
      end
    end
    
    it "shows the chef's name" do
      visit dish_path(@mac_cheese)
      
      within("#dish-details") do
        expect(page).to have_content(@chef.name)
      end
    end
    
    it "shows the total calorie count for that dish" do
      visit dish_path(@mac_cheese)
      
      within("#dish-details") do
        expect(page).to have_content(@mac_cheese.calorie_count)
      end
      save_and_open_page
    end
  end

end
