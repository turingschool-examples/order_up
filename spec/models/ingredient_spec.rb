require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :calories}
  end

  describe 'relationships' do
    it {should have_many :dish_ingredients}
  end

  describe 'class methods' do
    it 'counts total calories' do
      
    beef = Ingredient.create!(name: 'beef', calories: 350)
    bread = Ingredient.create!(name: 'bread', calories: 100)
    sauce = Ingredient.create!(name: 'tomato paste', calories: 50)

    expect(Ingredient.calorie_count).to eq(500)
    end
  end
end
