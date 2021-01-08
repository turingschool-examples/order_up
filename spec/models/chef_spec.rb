require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end
  describe "model methods" do
    it "has top 3 ingredients" do
      chef = Chef.create(name: "Rordan Gamsey")
      dish2 = chef.dishes.create(name: "Water", description: "A glass of water")
      dish = chef.dishes.create(name: "Ice Water", description: "A glass of ice water")
      lemon = Ingredient.create(name: "Artisinal slice of lemon", calories: 6)
      h = Ingredient.create(name: "H", calories: 0)
      o = Ingredient.create(name: "O", calories: 0)
      ice = Ingredient.create(name: "Ice", calories: 1)
      Component.create(dish_id: dish.id, ingredient_id: h.id, amount: 2)
      Component.create(dish_id: dish.id, ingredient_id: o.id, amount: 1)
      Component.create(dish_id: dish.id, ingredient_id: lemon.id, amount: 1)
      Component.create(dish_id: dish2.id, ingredient_id: h.id, amount: 2)
      Component.create(dish_id: dish2.id, ingredient_id: o.id, amount: 1)
      Component.create(dish_id: dish2.id, ingredient_id: lemon.id, amount: 1)
      Component.create(dish_id: dish2.id, ingredient_id: ice.id, amount: 4)

      expect(chef.popular_ingredients.to_set).to eq([h.name,o.name,lemon.name].to_set)
    end
  end
end
