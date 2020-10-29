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
      @chef = Chef.create!(name: "Chef Casey")
      @dish = @chef.dishes.create!(name: "Mac n Cheese", description: "Creammy goodness")
      @cheese = Ingredient.create!(name: "Cheese", calories: 750)
      @pasta = Ingredient.create!(name: "Pasta", calories: 300)
      @breadcrumbs = Ingredient.create!(name: "Breadcrumbs", calories: 175)
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: @cheese.id)
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: @pasta.id)
      DishIngredient.create!(dish_id: @dish.id, ingredient_id: @breadcrumbs.id)
      @dish_2 = @chef.dishes.create!(name: "Pizza", description: "Amazing")
      @dough = Ingredient.create!(name: "Dough", calories: 300)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @cheese.id)
      DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @dough.id)
    end

    it "#all_chef_ingredients" do
      expect(@chef.all_chef_ingredients).to eq (["Breadcrumbs", "Cheese", "Dough", "Pasta"])
    end
  end
end
