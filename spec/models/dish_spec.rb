require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    Ingredient.destroy_all
    Dish.destroy_all
    DishIngredient.destroy_all
    Chef.destroy_all
    @chef = Chef.create(name: 'Chef 1')
    @dish1 = @chef.dishes.create(name: 'Dish 1', description: 'dish description')
    @ingredient1 = Ingredient.create(name: 'Chicken', calories: 100)
    @ingredient2 = Ingredient.create(name: 'Rice', calories: 200)
    @dish_ingredient1 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    describe "#total_calorie_count" do
      it "gets total calorie count for the dish" do
        expect(@dish1.total_calorie_count).to eq(300)
      end
    end
  end
end
