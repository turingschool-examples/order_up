require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :recipes }
    it { should have_many(:ingredients).through(:recipes)}
  end
  describe "methods" do
    chef = Chef.create(name: "Gordon Ramsay")
    spaghetti = chef.dishes.create(name: "Spaghetti", description: "A light, classical pasta dish with succulent tomato sauce and zesty home-made meatballs")
    pasta = spaghetti.ingredients.create(name: "Pasta", calories: 1200)
    basil = spaghetti.ingredients.create(name: "Basil", calories: 20)
    meatball = spaghetti.ingredients.create(name: "Meatball", calories: 600)
    tomato = spaghetti.ingredients.create(name: "Tomato", calories: 60)
    expect(dish.total_calories).to eq(1880)
  end
end
