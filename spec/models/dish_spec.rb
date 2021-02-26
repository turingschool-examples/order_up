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
    describe "#total_calories" do
      it "returns the sum of all the ingredients calories for the dish" do
        @chef2 = Chef.create!(name: "Tony")
        @dish2 = @chef2.dishes.create!(name: "Cheese Pizza", description: "Best Pizza in town")
        @ingredient4 = @dish2.ingredients.create!(name: "Dough", calories: 120)
        @ingredient5 = @dish2.ingredients.create!(name: "Cheese", calories: 180)
        @ingredient6 = @dish2.ingredients.create!(name: "Pizza Sauce", calories: 100)

        expect(@dish2.total_calories).to eq(400)
      end
    end
  end
end