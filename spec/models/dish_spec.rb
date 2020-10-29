require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :recipes}
    it {should have_many(:ingredients).through(:recipes)}
  end

  describe "instance methods" do
    it '#calorie_count' do
      chef_1 = Chef.create!(name: 'Chef Scott')
      ingredient_1 = Ingredient.create!(name: 'Peas', calories: 50)
      ingredient_2 = Ingredient.create!(name: 'Bacon', calories: 200)
      ingredient_3 = Ingredient.create!(name: 'Egg', calories: 100)
      ingredient_4 = Ingredient.create!(name: 'Spaghetti', calories: 300)
      dish_1 = chef_1.dishes.create!(name: 'Spaghetti Carbonara', description: 'Made with egg, bacon, and peas.')
      dish_2 = chef_1.dishes.create!(name: 'Eggs and Bacon', description: 'Simple protein breakfast.')
      Recipe.create!(ingredient: ingredient_1, dish: dish_1)
      Recipe.create!(ingredient: ingredient_2, dish: dish_1)
      Recipe.create!(ingredient: ingredient_3, dish: dish_1)
      Recipe.create!(ingredient: ingredient_4, dish: dish_1)
      Recipe.create!(ingredient: ingredient_2, dish: dish_2)
      Recipe.create!(ingredient: ingredient_3, dish: dish_2)

      expect(dish_1.calorie_count).to eq(650)
    end
  end
end
