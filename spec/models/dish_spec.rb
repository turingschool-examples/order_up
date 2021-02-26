require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredients}
  end

  describe "class methods" do
    it "counts caloies calorie_count" do
      @chef = Chef.create(name: "Gordan")
      @dish = @chef.dishes.create(name: "Pizza", description: "Tasty")
      @ingredient1 = @dish.ingredients.create(name: "Sauce", calories: 40)
      @ingredient2 = @dish.ingredients.create(name: "Crust", calories: 100)
      @ingredient3 = @dish.ingredients.create(name: "Cheese", calories: 90)

      expect(@dish.calorie_count).to eq(230)
    end
  end
end
