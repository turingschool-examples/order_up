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

  describe 'instance methods' do

    before :each do
      @chef = Chef.create!(name: 'Tom')
      @dish = @chef.dishes.create!(name: 'Pasta', description: 'Yummy')
      @ingredient1 = Ingredient.create!(name: 'pasta', calories: 5000)
      @ingredient2 = Ingredient.create!(name: 'salt', calories: 10)
      @dish_ingredient1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient1.id)
      @dish_ingredient2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient2.id)
    end

    it '#total_calories' do
      expect(@dish.total_calories).to eq(5010)
    end
  end 
end
