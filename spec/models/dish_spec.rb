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
  describe "instance methods" do
    it "can find the total calories of the dish" do
      chef1 = Chef.create(name: "Gordon Ramsay")
      dish1 = chef1.dishes.create(name: "Beef Wellington", description: "Amazing")
      ingredient1 = Ingredient.create(name: "Beef", calories: 100)
      ingredient5 = Ingredient.create(name: "Bread Crumbs", calories: 35)
      DishIngredient.create(dish: dish1, ingredient: ingredient5)
      DishIngredient.create(dish: dish1, ingredient: ingredient1)

      expect(dish1.calories).to eq(135)
    end
  end
end
