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
    it ".calorie_count" do 
      @chef_1 = Chef.create!(
        name: "TestChef1")
      @dish_1 = Dish.create!(
        name: "TestDish1",
        description:  "TestDescription1",
        chef_id: "#{@chef_1.id}")
      @ingredient_1 = Ingredient.create!(
        name: "testingredient1",
        calories: 200)
      @ingredient_2 = Ingredient.create!(
        name: "testingredient2",
        calories: 400)
      @ingredient_dish_1 = IngredientDish.create!(
        ingredient_id: "#{@ingredient_1.id}",
        dish_id: "#{@dish_1.id}")
      @ingredient_dish_2 = IngredientDish.create!(
        ingredient_id: "#{@ingredient_2.id}",
        dish_id: "#{@dish_1.id}")
      expect(@dish_1.calorie_count).to eq(600)
    end
  end
end
