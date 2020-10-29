require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "find_ingredients" do
      chef_steve = Chef.create!(name: "Steve")
      pbj = chef_steve.dishes.create!(name: "PeanutButter Jelly",
                         description: "Most delicious")
      peanutbutter = pbj.ingredients.create!(name: "PeanutButter",
                                             calories: 1337)
      jelly = pbj.ingredients.create!(name: "Jelly",
                                             calories: 9999)
      bread = pbj.ingredients.create!(name: "Bread",
                                             calories: 250)
      ham_sammy = chef_steve.dishes.create!(name: "Ham Sammy",
                         description: "Most delicious")
      ham = ham_sammy.ingredients.create!(name: "Ham",
                                             calories: 1337)
      cheese = ham_sammy.ingredients.create!(name: "Cheese",
                                             calories: 9999)
      bread = ham_sammy.ingredients.create!(name: "Bread",
                                             calories: 250)

      expect(chef_steve.find_ingredients).to eq(["PeanutButter", "Jelly", "Bread", "Ham", "Cheese"])                                       
    end
  end
end
