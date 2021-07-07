require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    it ".total_calories" do
      @chef_1 = Chef.create!(name: "Mike Dao")
      @dish_1 = Dish.create!({name: "Pancakes", description: "Yummy, fluffy, buttery, goodness", chef_id: @chef_1.id})
      @egg = Ingredient.create!(name: "egg", calories: 80)
      @butter = Ingredient.create!(name: "butter", calories: 90)
      @sugar = Ingredient.create!(name: "sugar", calories: 100)

      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @egg.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @butter.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @sugar.id})

      expect(@dish_1.total_calories).to eq(270)
    end
  end
end
