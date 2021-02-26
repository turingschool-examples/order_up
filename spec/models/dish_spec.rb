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
    it "should calculate total callories of ingredients in the dish" do
      @chef = Chef.create(name: "Swedish Chef")
      @dish = @chef.dishes.create(name: "Orgabork", description: "Bork Bork Bork")
      @ingredient1 = @dish.ingredients.create(name: "Chicken", calories: 50)
      @ingredient2 = @dish.ingredients.create(name: "Fish", calories: 50)
      expect(@dish.total_callories).to eq(100)
    end
  end
end
