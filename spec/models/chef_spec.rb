require 'rails_helper'

RSpec.describe Chef, type: :model do
  before :each do
    Ingredient.destroy_all
    Dish.destroy_all
    DishIngredient.destroy_all
    Chef.destroy_all
    @chef = Chef.create(name: 'Chef 1')
    @dish1 = @chef.dishes.create(name: 'Dish 1', description: 'dish description')
    @dish2 = @chef.dishes.create(name: 'Dish 2', description: 'dish2 description')
    @ingredient1 = Ingredient.create(name: 'Chicken', calories: 100)
    @ingredient2 = Ingredient.create(name: 'Rice', calories: 200)
    @ingredient3 = Ingredient.create(name: 'Beef', calories: 150)
    @dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient3.id)
    @dish_ingredient4 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
  end
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:dish_ingredients).through(:dishes)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    describe "#unique_ingredients" do
      it "gets unique ingredients for that chef" do
        expect(@chef.unique_ingredients).to eq(["Beef", "Chicken", "Rice"])
      end
    end
  end
end
