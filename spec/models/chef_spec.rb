require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    it "#all_ingredients" do
      @wolfgang = Chef.create(name: "Wolfgang Puck")

      @ribeye_potatoes = @wolfgang.dishes.create(name: "Classic Ribeye Steak with Potatoes", description: "Locally farmed and very tender")
      @ribeye = Ingredient.create(name: "Ribeye", calories: 350)
      @potatoes = Ingredient.create(name: "Potatoe", calories: 125)


      @lamb_asparagus = @wolfgang.dishes.create(name: "Rosemary Lamb Shank and Asparagus", description: "Best lamb ever")
      @lamb = Ingredient.create(name: "Lamb", calories: 200)
      @rosemary = Ingredient.create(name: "Rosemary", calories: 25)
      @asparagus = Ingredient.create(name: "Asparagus", calories: 100)

      DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @ribeye.id)
      DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @potatoes.id)
      DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @rosemary.id)

      DishIngredient.create(dish_id: @lamb_asparagus.id, ingredient_id: @lamb.id)
      DishIngredient.create(dish_id: @lamb_asparagus.id, ingredient_id: @asparagus.id)
      DishIngredient.create(dish_id: @lamb_asparagus.id, ingredient_id: @rosemary.id)

     expect(@wolfgang.all_ingredients).to eq([@asparagus.name, @lamb.name, @potatoes.name, @ribeye.name, @rosemary.name])
    end
  end
end
