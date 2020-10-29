require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :recipes }
    it { should have_many(:ingredients).through(:recipes) }
  end

  describe 'instance methods' do
    it '#total_calories' do
      julia = Chef.create!(name: "Julia Child")
      chicken_parm = Dish.new(
        name: "Chicken Parmesan",
        description: "Cheesy breaded chicken",
        chef: julia
      )
      chicken = Ingredient.create!(
        name: "Chicken",
        calories: "200"
      )
      mozzerella = Ingredient.create!(
        name: "Mozzerella",
        calories: "150"
      )
      sauce = Ingredient.create!(
        name: "Tomato Sauce",
        calories: "90"
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: chicken
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: mozzerella
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: sauce
      )

      expect(chicken_parm.total_calories).to eq(440)
    end
  end
end
