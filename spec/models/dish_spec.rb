require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredient_dishes}
    it {should have_many(:ingredients).through(:ingredient_dishes)}
  end
  describe "instance methods" do
    describe "#approximate_calories" do
      it 'calculates the total calories of a dish by ingredients' do
        taiki = Chef.create!(name: "Joseph Taiki")
        onion_soup = taiki.dishes.create!(name: "Onion Soup", description: "Homemade taste with organic and local grown ingredients. Vegetarian and Vegan options available!")
        onion = onion_soup.ingredients.create!(name: "White Onion", calories: 5)
        broth = onion_soup.ingredients.create!(name: "Hearty Veggie Broth", calories: 10)
        cheese = onion_soup.ingredients.create!(name: "Vegan Cheese", calories: 25)

        expect(onion_soup.approximate_calories).to eq(40)

        regular_cheese = onion_soup.ingredients.create!(name: "Non-vegan Cheese", calories: 37)

        expect(onion_soup.approximate_calories).to eq(77)
      end
    end
  end
end
