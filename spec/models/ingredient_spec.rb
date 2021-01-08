require 'rails_helper'

RSpec.describe Ingredient do
  describe 'relationships' do
    it {should have_many :dishes}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end

  describe 'class methods' do
    let!(:ingredient_1) {Ingredient.create(name: "macaroni", calories: 390)}
    let!(:ingredient_2) {Ingredient.create(name: "cheese", calories: 531)}
    let!(:ingredient_3) {Ingredient.create(name: "cream", calories: 28)}

    it '.total_calories' do
      expect(Ingredient.total_calories).to eq(949)
    end
  end
end
