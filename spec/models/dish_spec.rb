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

  before :each do
    @chef = Chef.create!(name: "Billy bob")
    @dish_1 = @chef.dishes.create!(name: "Salad", description: "Super healthy")
    @ingredient_1 = @dish_1.ingredients.create!(name: "Spinach", calories: 25)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Feta cheese", calories: 50)
    @ingredient_3 = @dish_1.ingredients.create!(name: "Tomatoes", calories: 15)
  end

  describe "class methods" do
    it 'Can find dish total calories' do
      expect(@dish_1.total_calories). to eq(90)
    end
  end
end
