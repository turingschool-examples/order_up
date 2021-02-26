require 'rails_helper'

RSpec.describe Chef, type: :model do
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
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "class methods" do
    describe '::chef_ingredients' do
      it 'Create a test for a corresponding method that returns an chef name' do
        expect(Chef.chef_ingredients(@chef.id)[0]).to eq(@sauce)
      end
    end
  end
end
