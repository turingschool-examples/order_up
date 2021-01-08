require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create(name: "Chef Boyardee")
      @dish = @chef.dishes.create(name: "Soup", description: "its soup")
      @ingredient1 = Ingredient.create(name: "Noodles", calories: 50)
      @ingredient2 = Ingredient.create(name: "Chicken broth", calories: 20)
      @ingredient3 = Ingredient.create(name: "Chicken", calories: 55)

      @dish2 = @chef.dishes.create(name: "Mac & Cheese", description: "its mac and cheese but theres also chicken")
      @ingredient4 = Ingredient.create(name: "Macaroni", calories: 50)
      @ingredient5 = Ingredient.create(name: "Cheese", calories: 20)
      @ingredient6 = Ingredient.create(name: "Chicken", calories: 55)

      IngredientDish.create(ingredient: @ingredient1, dish: @dish, amount: 1)
      IngredientDish.create(ingredient: @ingredient2, dish: @dish, amount: 2)
      IngredientDish.create(ingredient: @ingredient3, dish: @dish, amount: 3)

      IngredientDish.create(ingredient: @ingredient4, dish: @dish2, amount: 1)
      IngredientDish.create(ingredient: @ingredient5, dish: @dish2, amount: 2)
      IngredientDish.create(ingredient: @ingredient6, dish: @dish2, amount: 3)
    end

    it "top_ingredients" do
      expect(@chef.top_ingredients.to_a).to eq([@ingredient1, @ingredient2, @ingredient3])
    end
  end
end
