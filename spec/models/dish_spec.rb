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
  
  before :each do
    @bob = Chef.create!(name: "Bob")

    @dish_1 = @bob.dishes.create!(name: "Dish 1", description: "particularly delicious")
    @dish_2 = @bob.dishes.create!(name: "Dish 2", description: "xtra delicious")
    @dish_3 = @bob.dishes.create!(name: "Dish 3", description: "massive delicious")

    @ingredient_1 = Ingredient.create!(name: "A")
    @ingredient_2 = Ingredient.create!(name: "B")
    @ingredient_3 = Ingredient.create!(name: "C")
    @ingredient_4 = Ingredient.create!(name: "D")

    Recipe.create!(dish: @dish_1, ingredient: @ingredient_1)
    Recipe.create!(dish: @dish_1, ingredient: @ingredient_2)
    Recipe.create!(dish: @dish_1, ingredient: @ingredient_3)

    Recipe.create!(dish: @dish_2, ingredient: @ingredient_1)
    Recipe.create!(dish: @dish_2, ingredient: @ingredient_2)

    Recipe.create!(dish: @dish_3, ingredient: @ingredient_1)
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_2)
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_3)
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_4)
  end

  describe 'instance methods' do
    it '#chefs_name' do
      expect(@dish_1.chefs_name).to eq(@bob.name)
    end
  end
end
