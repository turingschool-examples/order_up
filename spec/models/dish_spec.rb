require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :recipes }
    it { should have_many(:ingredients).through(:recipes) }
  end

  describe "instance methods" do
    before :each do
      @chef_1 = Chef.create!(name: "Emeril Lagasse")
      @dish_1 = @chef_1.dishes.create!(name: "Jalapeno Cornbread", description: "The cornbread has the perfect texture and the jalapenos add a great kick.")
      @corn = @dish_1.ingredients.create!(name: "corn", calories: 132)
      @milk = @dish_1.ingredients.create!(name: "milk", calories: 122)
      @jalapeno = @dish_1.ingredients.create!(name: "jalapeno", calories: 4)
      @flour = @dish_1.ingredients.create!(name: "flour", calories: 100)

    end
      it "#total_calories" do

      expect(@dish_1.total_calories).to eq(358)
      end
  end
end
