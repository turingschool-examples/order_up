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
  describe "methods" do
    before(:each) do
      @chef = Chef.create!(
        name: "SpongeBob"
      )

      @burger = Dish.create!(
        name: "Krabby Patty",
        description: "Delicious undersea burger",
        chef_id: @chef.id
      )

      @fries = Dish.create!(
        name: "Kelp Fries",
        description: "Perfect side to a Krabby Patty",
        chef_id: @chef.id
      )

      @patty = Ingredient.create!(
        name: "Burger Patty",
        calories: 300
      )

      @lettuce = Ingredient.create!(
        name: "Lettuce",
        calories: 10
      )

      @bun = Ingredient.create!(
        name: "Burger Bun",
        calories: 30
      )

      @kelp = Ingredient.create!(
        name: "Kelp",
        calories: 10
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @patty.id 
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @lettuce.id 
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @bun.id 
      )

      Recipe.create!(
        dish_id: @fries.id,
        ingredient_id: @kelp.id 
      )
    end
    it 'total_calories' do
      expect(@burger.total_calories).to eq(340)
    end
    
  end
  
end
