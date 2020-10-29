require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:recipes)}
  end

  describe 'instance methods' do
    it "#total_calories" do
      chef_1 = Chef.create(name: "Mario")
      dish_1 = Dish.create(name: "Spaghetti",
                           description: "Pasta",
                           chef_id: chef_1.id)
      ingredient_1 = Ingredient.create(name: "Sauce",
                                       calories: 300)
      ingredient_2 = Ingredient.create(name: "Noodles",
                                       calories: 500)
      recipe_1 = Recipe.create(dish_id: dish_1.id,
                              ingredient_id: ingredient_1.id)
      recipe_1 = Recipe.create(dish_id: dish_1.id,
                               ingredient_id: ingredient_2.id)
      expect(dish_1.total_calories).to eq(800)
    end
  end
end
