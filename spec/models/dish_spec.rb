require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    it '#chef_name' do
      chef = Chef.create(name: 'Taylor Phillips')
      dish = Dish.create(name: 'Steak', description: 'Very good', chef_id: chef.id) 

      expect(dish.chef_name).to eq('Taylor Phillips')
    end

    it '#total_calories' do
      chef = Chef.create(name: 'Taylor Phillips')
      dish = Dish.create(name: 'Steak', description: 'Very good', chef_id: chef.id) 
      ingredient1 = Ingredient.create(name: 'Filet', calories: 950)
      ingredient2 = Ingredient.create(name: 'Butter', calories: 400)
      ingredient3 = Ingredient.create(name: 'Thyme', calories: 15)

      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient1.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient2.id)
      DishIngredient.create(dish_id: dish.id, ingredient_id: ingredient3.id)

      expect(dish.total_calories).to eq(1365)
    end
  end
end
