require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:dish_ingredients).through(:dishes)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before :each do
    chef1 = Chef.create(name: "Brisa")

    @dish_1 = @chef1.dishes.create!(name: "Dish 1", description: "Umami")
    @dish_2 = @chef1.dishes.create!(name: "Dish 2", description: "Sweet")

    @ingredient_1 = Ingredient.create!(name: "one", calories: 18)
    @ingredient_2 = Ingredient.create!(name: "two", calories: 37)
    @ingredient_3 = Ingredient.create!(name: "three", calories: 290)
    @ingredient_4 = Ingredient.create!(name: "four", calories: 120)
    @ingredient_5 = Ingredient.create!(name: "five", calories: 2)

    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1, quantity: 4)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2, quantity: 1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5, quantity: 27)

    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3, quantity: 6)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4, quantity: 12)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5, quantity: 9)
  end

  # describe 'instance methods' do
  #   it '#unique_ingredients' do
  #     expect(@chef1.unique_ingredients).to eq([@something])
  #   end
  # end
end
