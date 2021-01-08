require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    it 'can find the chef name' do
      @chef = Chef.create!(name: "Gordon Ramsey")
      @dish = Dish.create!(name: "Beef Wellington", description: "A delightful beef lightly coated", chef_id: @chef.id)

      expect(@dish.chef_name).to eq('Gordon Ramsey')
    end
  end
end
