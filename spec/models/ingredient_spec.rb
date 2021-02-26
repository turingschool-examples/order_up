require 'rails_helper'

RSpec.describe Ingredient, type: :model do
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
    @ingredient4 = Ingredient.create(name: 'Salad', calories: 25)
    @dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    @dish_ingredient4 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient1.id)
    @dish_ingredient5 = DishIngredient.create(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
  end
  describe "validations" do
    it { should validate_presence_of :name }
  end
  describe "relationships" do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
    it {should have_many(:chefs).through(:dishes)}
  end

  describe "instance methods" do
    describe "#popular_ingredients" do
      it "gets 3 most popular ingredients for that chef" do
        ingredients = Ingredient.popular_ingredients_by_chef(@chef.id)
        expect(ingredients.map(&:name)).to eq([@ingredient1.name, @ingredient4.name, @ingredient2.name])
      end
    end
  end
end
