require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "can count total calories" do
    it "of that dish" do
      chef = Chef.create!(name: "Daniel")
      dish = Dish.create!(name: "fruit bowl", description: "A bowl of fruit", chef_id: "#{chef.id}")
      ingredient = Ingredient.create!(name: "Apple", calories: 50, dish_id: "#{dish.id}")

      calorie_count = dish.calorie_count

      expect(calorie_count).to eq(ingredient.calories)
    end
  end
end
