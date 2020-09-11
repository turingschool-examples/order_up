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

  describe "methods" do
    it "#total_calories" do
      @wolfgang = Chef.create(name: "Wolfgang Puck")
      @ribeye_potatoes = @wolfgang.dishes.create(name: "Classic Ribeye Steak with Potatoes", description: "Locally farmed and very tender")
      @ribeye = Ingredient.create(name: "Ribeye", calories: 350)
      @potatoes = Ingredient.create(name: "Potatoe", calories: 125)

      DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @ribeye.id)
      DishIngredient.create(dish_id: @ribeye_potatoes.id, ingredient_id: @potatoes.id)

     expect(@ribeye_potatoes.total_calories).to eq("475")
   end
  end
end
