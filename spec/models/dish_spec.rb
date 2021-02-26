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
    describe '#total_calorie_count' do
      it "will sum the calories of all ingredients for the dish" do
        @chef = Chef.create!(name: "Gordan Ramsey")
        @dish = @chef.dishes.create!(name: "Burrito", description: "A simple bean and cheese burrito")
        @tortilla = Ingredient.create!(name: "Tortilla", calories: 200)
        @beans = Ingredient.create!(name: "Pinto Beans", calories: 150)
        @cheese = Ingredient.create!(name: "Sharp Chedder", calories: 175)
        DishIngredient.create!(dish: @dish, ingredient: @tortilla)
        DishIngredient.create!(dish: @dish, ingredient: @beans)
        DishIngredient.create!(dish: @dish, ingredient: @cheese)

        expect(@dish.total_calorie_count).to eq(525)
      end
    end
  end
end
