require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    describe '#chef_name' do
      it 'should return name of chef who owns the dish' do
        chef = Chef.create!(name: 'Guy Fieri')
        chef.dishes.create!(name: 'Burger', description: 'A classic.')

        expect(chef.dishes.first.chef_name).to eq('Guy Fieri')
      end
    end
  end
end
