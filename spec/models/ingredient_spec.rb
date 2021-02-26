require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  before :each do
    @ingredient_1 = Ingredient.create!(name: 'onions', calories: 100)
    @ingredient_2 = Ingredient.create!(name: 'noodles', calories: 350)
    @ingredient_3 = Ingredient.create!(name: 'sauce', calories: 200)
  end

  describe 'class methods' do
    describe '::total_calories' do
      it 'returns total calories' do
        expected = @ingredient_1.calories + @ingredient_2.calories + @ingredient_3.calories

        expect(Ingredient.total_calories).to eq(expected)
      end
    end
  end
end
