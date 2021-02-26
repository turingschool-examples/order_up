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

  it "we can total calories in a dish" do
    chef = Chef.create(name: "Bobby Flay")
    dish_1 = chef.dishes.create(name: "Cheese Burger", description: "Delicious")
    cheese = dish_1.ingredients.create(name: "American cheese", calories: 100)
    beef = dish_1.ingredients.create(name: "beef", calories: 200)
    expect(dish_1.calorie_count).to eq(300)
  end
end
