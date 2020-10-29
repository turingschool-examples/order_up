# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :dishes }
    it { should have_many(:ingredients).through(:dishes) }
  end
  describe 'instance methods' do
    it 'top three ingredients' do
      chef = Chef.create!(name: 'Cheif')

      mac = Ingredient.create!(name: 'mac', calories: 200)
      cheese = Ingredient.create!(name: 'cheese', calories: 200)
      hamburger_patty = Ingredient.create!(name: 'patty', calories: 120)
      tomato = Ingredient.create!(name: 'tomato', calories: 60)

      dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)
      dish2 = Dish.create!(name: 'Ham Burger', description: 'burgery', chef_id: chef.id)
      dish3 = Dish.create!(name: 'Hamburder Helper', description: 'burgery', chef_id: chef.id)

      DishIngredient.create!(dish_id: dish.id, ingredient_id: mac.id)
      DishIngredient.create!(dish_id: dish.id, ingredient_id: cheese.id)

      DishIngredient.create!(dish_id: dish2.id, ingredient_id: cheese.id)
      DishIngredient.create!(dish_id: dish2.id, ingredient_id: hamburger_patty.id)
      DishIngredient.create!(dish_id: dish2.id, ingredient_id: tomato.id)

      DishIngredient.create!(dish_id: dish3.id, ingredient_id: hamburger_patty.id)
      DishIngredient.create!(dish_id: dish3.id, ingredient_id: cheese.id)
      DishIngredient.create!(dish_id: dish3.id, ingredient_id: mac.id)

<<<<<<< HEAD
      expect(chef.top_three_ingredients[0].name).to eq(cheese.name)
=======
      expect(chef.top_three_ingredients).to eq([cheese, mac, hamburger_patty])
>>>>>>> 71536483dea284c8cd462406e05a4650e53cbd66
    end
  end
end
