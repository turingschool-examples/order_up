require 'rails_helper'

RSpec.describe Dish, type: :model do
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

    before :each do
      @chef = Chef.create!(name: "Chef Casey")
      @dish = @chef.dishes.create!(name: "Mac n Cheese", description: "Creammy goodness")
      @cheese = Ingredient.create!(name: "Cheese", calories: 750)
      @pasta = Ingredient.create!(name: "Pasta", calories: 300)
      @breadcrumbs = Ingredient.create!(name: "Breadcrumbs", calories: 175)
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: @cheese.id)
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: @pasta.id)
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: @breadcrumbs.id)
    end

    it "#total_calories" do
      expect(@dish.total_calories).to eq(1225)
    end
  end
end
