require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it '#unique_ingredients' do
      @chef = Chef.create!(name: "Bob")
      @curry = @chef.dishes.create!(name: "Curry", description: "Flavor!")
      @in1 = Ingredient.create!(name: "Flour", calories: 15)
      @in2 = Ingredient.create!(name: "egg", calories: 20)
      @in3 = Ingredient.create!(name: "sugar", calories: 10)

      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 1)
      DishIngredient.create!(dish: @curry, ingredient: @in1, count: 2)
      DishIngredient.create!(dish: @curry, ingredient: @in2, count: 1)

      expect(@chef.unique_ingredients).to eq([@in1, @in2])
    end

    it '#top_3' do
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

      expect(@chef.top_3_ingredients).to eq([@in3, @in1, @in2])
    end
  end
end
