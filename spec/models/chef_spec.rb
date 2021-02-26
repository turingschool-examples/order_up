require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "can find all of a chefs used ingredients" do
      chef1 = Chef.create(name: "Gordon Ramsay")
      dish1 = chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
      ingredient1 = Ingredient.create(name: "Beef", calories: 100)
      ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
      DishIngredient.create(dish: dish1, ingredient: ingredient5)
      DishIngredient.create(dish: dish1, ingredient: ingredient1)

      expect(chef1.ingredients).to eq([ingredient5, ingredient1])
    end
  end
end
