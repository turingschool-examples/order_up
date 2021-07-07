require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'relationships' do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end
  describe "model methods" do
    it "can count total calories" do
      Ingredient.create(name: "Ham", calories: 50)
      Ingredient.create(name: "Mustard", calories: 5)
      Ingredient.create(name: "Bun", calories: 120)

      expect(Ingredient.total_calories).to eq(175)

    end
  end
end
