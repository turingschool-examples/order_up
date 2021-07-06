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
    it '.calories' do
      @chef1 = Chef.create({name: "Ralph"})
      @dish1 = @chef1.dishes.create({name: "pasta", description: "noodles and sauce"})
      @noodles = Ingredient.create({name: "noodles", calories: 100})
      @sauce = Ingredient.create({name: "sauce", calories: 80})
      @d1_noodles = DishIngredient.create({dish_id: @dish1.id, ingredient_id: @noodles.id})
      @d1_sauce = DishIngredient.create({dish_id: @dish1.id, ingredient_id: @sauce.id})

      expect(@dish1.calories).to eq(180)
    end
  end
end
