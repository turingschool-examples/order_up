require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before :each do
    @chef = Chef.create!(name: "Bob")
    @dish_1 = Dish.create!(name: "Pasta", description: 'Good dish', chef_id: @chef.id)
    @dish_2 = Dish.create!(name: "Soup", description: 'Good soup', chef_id: @chef.id)

    @ingredient_1 = @dish_1.ingredients.create!(name: 'onions', calories: 100)
    @ingredient_2 = @dish_1.ingredients.create!(name: 'noodles', calories: 350)
    @ingredient_3 = @dish_1.ingredients.create!(name: 'sauce', calories: 200)
  end

  describe 'instance methods' do
    describe '#total_calories' do
      it 'returns total calories from all ingredients' do
        expected = @ingredient_1.calories + @ingredient_2.calories + @ingredient_3.calories
        
        expect(@dish_1.total_calories).to eq(expected)
      end
    end
  end
end
