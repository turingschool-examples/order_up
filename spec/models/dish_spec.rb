require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe 'instance methods' do 
    it 'returns total calories of dish' do 
      chef = Chef.create!(name: "Bourdain")

      dish = Dish.create!(name: "Pasta", description: "Chicken Alfredo", chef_id: chef.id)

      ingredient1 = Ingredient.create!(name: "Fettucine", calories: 200)
      ingredient2 = Ingredient.create!(name: "Chicken", calories: 250)
      ingredient3 = Ingredient.create!(name: "Alfredo", calories: 350)

      dish_ing1 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient1.id)
      dish_ing2 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient2.id)
      dish_ing3 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient3.id)

      total_cals = dish.total_calories
      
      expect(total_cals).to eq(800)
    end
  end
end
