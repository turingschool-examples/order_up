require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    it 'sums all calories' do
      @chef = Chef.create(name: "Bob")
      @dish = @chef.dishes.create(name: 'Pasta', description: 'Taste good')
      @ingredient1 = @dish.ingredients.create(name: 'oregano', calories: 0)
      @ingredient2 = @dish.ingredients.create(name: 'butter', calories: 10)

      expect(@dish.total_calories).to eq(10)
    end
  end
end
