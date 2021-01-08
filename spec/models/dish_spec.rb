require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :components}
    it {should have_many(:ingredients).through(:components)}
  end
  describe "model methods" do
    it "total calories" do
      chef = Chef.create(name: "Rordan Gamsey")
      dish = chef.dishes.create(name: "Water", description: "A glass of water")
      lemon = Ingredient.create(name: "Artisinal slice of lemon", calories: 6)
      h = Ingredient.create(name: "H", calories: 0)
      o = Ingredient.create(name: "O", calories: 0)
      Component.create(dish_id: dish.id, ingredient_id: h.id, amount: 2)
      Component.create(dish_id: dish.id, ingredient_id: o.id, amount: 1)
      Component.create(dish_id: dish.id, ingredient_id: lemon.id, amount: 1)

      expect(dish.total_calories).to eq(6)
    end
  end
end
