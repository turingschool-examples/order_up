require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end
  describe "instance methods" do
    it '#unique_ingredients_list' do
      chef = Chef.create!(name: 'Gordon Lambsauce')
      dish_1 = chef.dishes.create!(name: 'Idiot Sandwich', description: 'Tasty meal consisting of two breads and an idiot')
      dish_2 = chef.dishes.create!(name: 'Wet Sammich', description: 'Idiot Sandwich with Lambsauce')
      ingredient_1 = Ingredient.create!(name: 'Bread Loaf', calories: 100)
      ingredient_2 = Ingredient.create!(name: 'Idiot', calories: 150)
      ingredient_3 = Ingredient.create!(name: 'Lamb Sauce', calories: 200)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_1, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_1)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_2)
      DishIngredient.create!(dish: dish_2, ingredient: ingredient_3)

      expected = [ingredient_1, ingredient_2, ingredient_3]
      expect(chef.unique_ingredients_list).to eq(expected)
    end
  end
end
