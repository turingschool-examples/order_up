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
    describe '#calorie_count' do
      it 'sums all ingredient calories' do
        @chef = Chef.create!(name: "Tim")
        @mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')
        @pasta = @mac.ingredients.create!(name: 'pasta', calories: 1000)
        @cheese = @mac.ingredients.create!(name: 'cheese', calories: 100)

        expect(@mac.calorie_count).to eq(1100)
      end
      it 'returns 0 if no ingredients' do
        @chef = Chef.create!(name: "Tim")
        @mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')

        expect(@mac.calorie_count).to eq(0)
      end
    end
  end
end
