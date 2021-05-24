require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'returns sum of calories for the all ingredients in dish' do
        ina = Chef.create!(name: "Ina Garten")
        spaghetti = ina.dishes.create!(name: "Famous Spaghetti", description: "Flavorful marinara over bed of spaghetti")
        tomatoes = spaghetti.ingredients.create!(name: "Tomatoes", calories: 100)
        spaghetti_pasta = spaghetti.ingredients.create!(name: "Spaghetti Pasta", calories: 450)
        italian_herbs = spaghetti.ingredients.create!(name: "Italian Herbs", calories: 5)
        salt = spaghetti.ingredients.create!(name: "Salt", calories: 5)
        parmesan = spaghetti.ingredients.create!(name: "parmesan", calories: 100)

        expect(spaghetti.total_calories).to eq(660)
      end
    end
  end
end
