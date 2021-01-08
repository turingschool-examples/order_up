require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe 'relationships' do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many :ingredients}
  end
  describe 'instance methods' do
    describe 'calorie_count' do
      it 'should return the total calories in this dish' do
        chef_ryan = Chef.create!(name: 'Ryan')
        pizza = chef_ryan.dishes.create!(name: 'Pizza', description: 'Cheesy goodness')

        dough = Ingredient.create!(name: 'Dough', calories: 100)
        cheese = Ingredient.create!(name: 'Cheese', calories: 200)

        pizza.dish_ingredients.create!(ingredient_id: dough.id)
        pizza.dish_ingredients.create!(ingredient_id: cheese.id)

        expect(pizza.calorie_count).to eq(300)
      end
    end
  end
end
