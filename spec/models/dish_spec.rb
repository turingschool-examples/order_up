require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :recipies}
    it {should have_many(:ingredients).through(:recipies)}
  end
  describe "instance methods" do
    it "total_calories" do
      chef_steve = Chef.create!(name: "Steve")
      pbj = chef_steve.dishes.create!(name: "PeanutButter Jelly",
                         description: "Most delicious")
      peanutbutter = pbj.ingredients.create!(name: "PeanutButter",
                                             calories: 1337)
      jelly = pbj.ingredients.create!(name: "Jelly",
                                             calories: 9999)
      bread = pbj.ingredients.create!(name: "Bread",
                                             calories: 250)

      expect(pbj.total_calories).to eq(11586)
    end 
  end
end
