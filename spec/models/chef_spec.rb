require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should have_many :dishes }
    it { should have_many(:ingredients).through(:dishes) }
  end

  describe "instance methods" do
    before(:each) do
            @chef = Chef.create!(name: "Claire Saffitz")

      @flour = Ingredient.create!(name: "Flour", calories: 500)
      @yeast = Ingredient.create!(name: "Yeast", calories: 0)
      @salt = Ingredient.create!(name: "Salt", calories: 10)
      @evoo = Ingredient.create!(name: "Olive Oil", calories: 250)
      @apple = Ingredient.create!(name: "Apple", calories: 400)
      @sugar = Ingredient.create!(name: "Sugar", calories: 200)
      
      @dish_1 = @chef.dishes.create!(name: "Soft & Crispy Focaccia", description: "Lots of olive oil.")
      DishIngredient.create!(dish: @dish_1, ingredient: @flour)
      DishIngredient.create!(dish: @dish_1, ingredient: @yeast)
      DishIngredient.create!(dish: @dish_1, ingredient: @salt)
      DishIngredient.create!(dish: @dish_1, ingredient: @evoo)
      
      @dish_2 = @chef.dishes.create!(name: "Apple Pie", description: "Lots of apples.")
      DishIngredient.create!(dish: @dish_2, ingredient: @apple)
      DishIngredient.create!(dish: @dish_2, ingredient: @salt)
      DishIngredient.create!(dish: @dish_2, ingredient: @sugar)
      DishIngredient.create!(dish: @dish_2, ingredient: @flour)
      
      @dish_3 = @chef.dishes.create!(name: "Sourdough Boule", description: "Lots of sour.")
      DishIngredient.create!(dish: @dish_3, ingredient: @flour)
      DishIngredient.create!(dish: @dish_3, ingredient: @yeast)
      DishIngredient.create!(dish: @dish_3, ingredient: @salt)
    end
    it '#top_three_ingredients' do
      expected_top_3 = [@flour, @salt, @yeast]
      expect(@chef.top_three_ingredients).to eq(expected_top_3)
    end
  end
end
