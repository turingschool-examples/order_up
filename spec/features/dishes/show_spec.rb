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
      visit dish_path

    end
    it "shows a list of ingredients for that dish"
    it "shows the chef's name"
    it "shows the total calorie count for that dish"
  end

end
