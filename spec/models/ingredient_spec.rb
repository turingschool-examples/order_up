require 'rails_helper'

describe Ingredient, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end
  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end
  describe "calorie_total" do
    ingr_1 = Ingredient.create!(name: "beef patty", calories: 800)
    ingr_2 = Ingredient.create!(name: "gouda cheese", calories: 300)
    ingr_3 = Ingredient.create!(name: "onion", calories: 50)
    ingr_4 = Ingredient.create!(name: "bun", calories: 200)
    it "can count the total calories in a group of ingredients" do
      expect(Ingredient.calorie_total).to eq(1350)
    end
  end
  describe "unique_ingredients" do
    ingr_1 = Ingredient.create!(name: "beef patty", calories: 800)
    ingr_2 = Ingredient.create!(name: "gouda cheese", calories: 300)
    ingr_3 = Ingredient.create!(name: "onion", calories: 50)
    ingr_4 = Ingredient.create!(name: "bun", calories: 200)
    ingr_5 = Ingredient.create!(name: "bun", calories: 200)
    it "can show a list of ingredients without duplicates" do
      expect(Ingredient.unique_ingredients).to eq([ingr_1.name, ingr_2.name, ingr_3.name, ingr_4.name])
    end
  end
end
