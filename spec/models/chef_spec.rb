require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: "Chef1")
      @dish1 = @chef.dishes.create!(name: "Dish1", description: "Description1")
      @dish2 = @chef.dishes.create!(name: "Dish2", description: "Description2")
      @ingredient1 = Ingredient.create!(name: "Ingredient1", calories: 7)
      @ingredient2 = Ingredient.create!(name: "Ingredient2", calories: 3)
      @ingredient3 = Ingredient.create!(name: "Ingredient3", calories: 3)

      @dish1_ingredient1 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
      @dish1_ingredient2 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
      @dish2_ingredient2 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient2)
      @dish2_ingredient3 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient3)
    end

    it "#ingredients" do
      expect(@chef.ingredients).to eq(["Ingredient1", "Ingredient2", "Ingredient3"])
    end
  end
end
