require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance method' do
    it "can calculate total calories" do
      dani = Chef.create(name: "Dani Coleman")

      skinny = dani.dishes.create(name: "Skinny", description: "Hearty")

      lettuce = skinny.ingredients.create(name: "Lettuce", calories: 40)
      hb = skinny.ingredients.create(name: "Hashbrowns", calories: 100)

      expect(skinny.total_calories).to eq(140)
    end
  end
end
