require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :recipes}
    it {should have_many(:ingredients), through: :recipes}
  end
  describe "instance methods" do
    it 'counts total calories of the dish' do
      @chef1 = Chef.create!(name: "Catherine")
      @dish1 = Dish.create!(name: "Mac and Cheese", description: "So cheesy!", chef_id: @chef1.id )
      @dish2 = Dish.create!(name: "Cheese Fries", description: "So cheesy! So fries!", chef_id: @chef1.id )
      @ingredient1 = Ingredient.create!(name: "Mac", calories: 101)
      @ingredient2 = Ingredient.create!(name: "Cheese", calories: 286)
      @ingredient3 = Ingredient.create!(name: "Fries", calories: 223)
      Recipe.create!(ingredient_id: @ingredient1.id, dish_id: @dish1.id)
      Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish1.id)
      Recipe.create!(ingredient_id: @ingredient3.id, dish_id: @dish2.id)
      Recipe.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)

      expect(@dish1.calorie_count).to eq(387)
    end
  end
end
