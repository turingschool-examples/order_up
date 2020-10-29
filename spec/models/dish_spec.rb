require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    it '#chef_name' do
      chef = Chef.create(name: 'Taylor Phillips')
      dish = Dish.create(name: 'Steak', description: 'Very good', chef_id: chef.id) 

      expect(dish.chef_name).to eq('Taylor Phillips')
    end
  end
end
