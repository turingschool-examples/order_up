require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredient_dishes}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create(name: "Chef Boyardee")
      @dish = @chef.dishes.create(name: "Soup", description: "its soup")
      @ingredient1 = Ingredient.create(name: "Noodles", calories: 50)
      @ingredient2 = Ingredient.create(name: "Chicken broth", calories: 20)
      @ingredient3 = Ingredient.create(name: "Chicken", calories: 55)
      @ingredient4 = Ingredient.create(name: "Something that doesnt belong in soup", calories: 100)

      IngredientDish.create(ingredient: @ingredient1, dish: @dish, amount: 1)
      IngredientDish.create(ingredient: @ingredient2, dish: @dish, amount: 2)
      IngredientDish.create(ingredient: @ingredient3, dish: @dish, amount: 3)

    end

    it "calorie-count" do
      expect(@dish.calorie_count).to eq(255)
      IngredientDish.create(ingredient: @ingredient4, dish: @dish, amount: 1)
      expect(@dish.calorie_count).to eq(355)
    end
  end
end
