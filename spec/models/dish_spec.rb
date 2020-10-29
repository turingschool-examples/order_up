require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end
  describe "instance methods" do
    it '#total_calories' do
      elzar = Chef.create!(
        name: 'Elzar'
      )
      canned_gumbo = Ingredient.create!(
        name: "1x Can of Elzar's Down Home Neptunian Gumbo",
        calories: 2000
      )
      slug = Ingredient.create!(
        name: "1x Purple Neptunian Slug",
        calories: 5000
      )
      gumbo = elzar.dishes.create!(
        name: "Elzar's Down Home Neptunian Gumbo",
        description: "Causes horrible, nightmarish diarrhea.",
      )
      gumbo.ingredients << canned_gumbo
      gumbo.ingredients << slug

      expect(gumbo.total_calories).to eq(canned_gumbo.calories + slug.calories)
    end
  end
end
