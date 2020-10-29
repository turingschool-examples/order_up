require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :meals}
    it {should have_many(:ingredients).through(:meals)}
  end

  describe "instance_method" do
    it 'calorie_total' do
      chef = Chef.create!(name: 'Gordon Ramsey')
      dish = chef.dishes.create!(name: 'Chicken Mac n Cheese', description: 'One of the finest meals.')
      ingredient1 = Ingredient.create!(name: 'Cheese', calories: 200)
      ingredient2 = Ingredient.create!(name: 'Chicken', calories: 450)
      ingredient3 = Ingredient.create!(name: 'Pasta', calories: 300)
      Meal.create!(dish_id: dish.id, ingredient_id: ingredient1.id)
      Meal.create!(dish_id: dish.id, ingredient_id: ingredient2.id)
      Meal.create!(dish_id: dish.id, ingredient_id: ingredient3.id)

      expect(dish.calorie_total).to eq(950)
    end
  end
end
