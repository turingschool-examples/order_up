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

  describe "instance methods" do
    it "#total_caloeries" do
      @chef = Chef.create!(name: "Chef1")
      @dish = @chef.dishes.create!(name: "Dish1", description: "Description1")
      @ingredient1 = Ingredient.create!(name: "Ingredient1", calories: 7)
      @ingredient2 = Ingredient.create!(name: "Ingredient2", calories: 3)

      @dish_ingredient1 = DishIngredient.create!(dish: @dish, ingredient: @ingredient1)
      @dish_ingredient2 = DishIngredient.create!(dish: @dish, ingredient: @ingredient2)

      expect(@dish.total_calories).to eq(10)
    end
  end
end
