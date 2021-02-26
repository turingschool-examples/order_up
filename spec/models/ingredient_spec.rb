require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  before :each do
    @chef = Chef.create!(name: "Bob")

    @dish_1 = Dish.create!(name: "Pasta", description: 'Good dish', chef_id: @chef.id)
    @dish_2 = Dish.create!(name: "Soup", description: 'Good soup', chef_id: @chef.id)

    @ingredient_1 = Ingredient.create!(name: 'onions', calories: 100)
    @ingredient_2 = Ingredient.create!(name: 'noodles', calories: 350)
    @ingredient_3 = Ingredient.create!(name: 'sauce', calories: 200)

    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
  end

  describe 'class methods' do
    describe '::total_calories' do
      it 'returns total calories' do
        expected = @ingredient_1.calories + @ingredient_2.calories + @ingredient_3.calories

        expect(Ingredient.total_calories).to eq(expected)
      end
    end

    describe '::find_from_chef' do
      it 'returns ingredients from dishes that belong to a specific chef' do
        expected = [@ingredient_1, @ingredient_2, @ingredient_3]

        expect(Ingredient.find_from_chef(@chef.id)).to eq(expected)
      end
    end
  end
end
