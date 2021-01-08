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

  describe "calorie_count" do
    before do
      @chef = Chef.create!(name: "Chef Aiden")
      @chicken_alfredo = @chef.dishes.create!(name: "Chicken Alfredo", description: "It's alfredo-y!")
      @chicken = @chicken_alfredo.ingredients.create!(name: "chicken", calories: 400)
      @alfredo_sauce = @chicken_alfredo.ingredients.create!(name: "alfredo sauce", calories: 750)
    end
    it "returns the sum of calories" do
      result = @chicken_alfredo.calorie_count
      expect(result).to eq(@chicken.calories + @alfredo_sauce.calories)
    end
  end
end
