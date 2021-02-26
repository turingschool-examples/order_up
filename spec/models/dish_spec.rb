require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    chef = Chef.create!(name: 'Guy Fieri')
    @dish = chef.dishes.create!(name: 'Burger', description: 'A classic.')
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    describe '#chef_name' do
      it 'should return name of chef who owns the dish' do
        expect(@dish.chef_name).to eq('Guy Fieri')
      end
    end

    describe '#calories' do
      it 'should return sum of ingredient calories' do
        @dish.ingredients.create!(name: 'Bun', calories: 10)
        @dish.ingredients.create!(name: 'Meat', calories: 50)

        expect(@dish.calories).to eq(60)
      end
    end
  end
end
