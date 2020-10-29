# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end
  describe 'instance methods' do
    it 'total calories' do
      chef = Chef.create!(name: 'Cheif')

      mac = Ingredient.create!(name: 'mac', calories: 200)
      cheese = Ingredient.create!(name: 'cheese', calories: 200)

      dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)

      DishIngredient.create!(dish_id: dish.id, ingredient_id: mac.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: cheese.id)

      expect(dish.total_calories).to eq(400)
    end
  end
end
