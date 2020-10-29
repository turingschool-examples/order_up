require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "class methods" do
    it 'can sum the total calories' do 
      chef_1 = Chef.create!(name: 'Pierre')
      dish_1 = chef_1.dishes.create!(name: 'Crepes',
                                    description: 'fruity omelette/pancake')
      ingredient_1 = dish_1.ingredients.create!(name: 'Flour',
                      calories: 200)
      ingredient_2 = dish_1.ingredients.create!(name: 'Eggs',
                      calories: 100)
      ingredient_3 = dish_1.ingredients.create!(name: 'Milk',
                      calories: 200)
      ingredient_4 = dish_1.ingredients.create!(name: 'Butter',
                      calories: 300)
      expect(dish_1.total_calories).to eq(800)
    end 
  end
end
