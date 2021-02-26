require 'rails_helper'

RSpec.describe Dish, type: :model do
  before(:each) do
    @chef = Chef.create!(name: "Big Sloppy Sal")
    @dish_1 = @chef.dishes.create!(name: "Pizza", description: "Better than your mothers!")

    @sauce = Ingredient.create!(name: "tomatoe sauce", calories: 50)
    @cheese = Ingredient.create!(name: "cheese", calories: 150)
    @dough = Ingredient.create!(name: "pizza dough", calories: 100)

    DishIngredient.create!(dish: @dish_1, ingredient: @sauce)
    DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
    DishIngredient.create!(dish: @dish_1, ingredient: @dough)
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    describe '#chef_name' do
      it 'Create a test for a corresponding method that returns an chef name' do
        expect(@dish_1.chef_name).to eq("Big Sloppy Sal")
      end
    end
    
    describe '#calories' do
      it 'Create a test for a corresponding method that returns a dishes calories' do
        expect(@dish_1.calories).to eq(300)
      end
    end
  end
end
