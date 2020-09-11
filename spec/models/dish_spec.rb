require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :recipes}
    it { should have_many(:ingredients).through(:recipes) }
  end

  describe "instance methods" do
    it "#calorie_count" do
      chef1 = Chef.create(name: 'Chef Un')

      pasta = Dish.create(name: 'La pasta', description:'La best pasta', chef: chef1)

      tomato_sause = Ingredient.create(name: 'tomato sause', calories: 10)
      meat_balls = Ingredient.create(name: 'meat balls', calories: 100)
      salt = Ingredient.create(name: 'salt', calories: 1)

      Recipe.create(dish: pasta, ingredient: tomato_sause)
      Recipe.create(dish: pasta, ingredient: meat_balls)
      Recipe.create(dish: pasta, ingredient: salt)

      expected = pasta.ingredients.sum { |ingredient| ingredient.calories }

      expect(pasta.calorie_count).to eq(expected)
    end
  end
end
