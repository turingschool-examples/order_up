require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'instance methods' do
    it ".chef_ingredients shows duplicate ingredients just once" do
      @chef_1 = Chef.create!(name: "Mike Dao")
      @dish_1 = Dish.create!({name: "Pancakes", description: "Yummy, fluffy, buttery, goodness", chef_id: @chef_1.id})
      @dish_2 = Dish.create!({name: "Grilled Cheese", description: "Gooey cheesy amazingness", chef_id: @chef_1.id})
      @egg = Ingredient.create!(name: "egg", calories: 80)
      @butter = Ingredient.create!(name: "butter", calories: 90)
      @sugar = Ingredient.create!(name: "sugar", calories: 100)
      @cheese = Ingredient.create!(name: "cheese", calories: 150)
      @bread = Ingredient.create!(name: "bread", calories: 100)

      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @egg.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @butter.id})
      DishIngredient.create!({dish_id: @dish_1.id, ingredient_id: @sugar.id})

      DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @butter.id})
      DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @bread.id})
      DishIngredient.create!({dish_id: @dish_2.id, ingredient_id: @cheese.id})

      expect(@chef_1.chef_ingredients.count).to eq(5)
      expect(@chef_1.chef_ingredients.count).to_not eq(6)
    end
  end
end
