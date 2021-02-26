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

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "instance methods" do
    describe "#total_calories" do
      it "can sum up the total calories for a dish" do
        ingredient1 = dish1.ingredients.create(name: 'pasta', calories: 250)
        ingredient2 = dish1.ingredients.create(name: 'marinara sauce', calories: 100)
        ingredient3 = dish1.ingredients.create(name: 'meatballs', calories: 700)

        expect(Dish.total_calories.round(2)).to eq(350)
      end
    end
  end
end
