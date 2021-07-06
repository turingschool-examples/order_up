require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it ".ingredients" do
      @chef1 = Chef.create({name: "Ralph"})
      @dishr = @chef1.dishes.create({name: "pasta w red sauce", description: "noodles and red sauce"})
      @dishw = @chef1.dishes.create({name: "pasta w white sauce", description: "noodles and white sauce"})
      @noodles = Ingredient.create({name: "noodles", calories: 100})
      @wsauce = Ingredient.create({name: "white sauce", calories: 80})
      @rsauce = Ingredient.create({name: "red sauce", calories: 75})
      @dishr_noodles = DishIngredient.create({dish_id: @dishr.id, ingredient_id: @noodles.id})
      @dishr_rsauce = DishIngredient.create({dish_id: @dishr.id, ingredient_id: @rsauce.id})
      @dishw_noodles = DishIngredient.create({dish_id: @dishw.id, ingredient_id: @noodles.id})
      @dishw_wsauce = DishIngredient.create({dish_id: @dishw.id, ingredient_id: @wsauce.id})

      expect(@chef1.ingredients.pluck("ingredients.name")).to eq(["noodles", "red sauce", "white sauce"])
    end
  end
end
