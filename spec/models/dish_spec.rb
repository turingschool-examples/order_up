require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe "instance methods" do
    @chef    = Chef.create!(name: "Gordon Ramsay")
    @dish    = Dish.create!(name: "Avocado and Egg Toast",
                            description: "Smashed avocado toast with hardboiled eggs.",
                            chef_id: @chef.id)
    @avocado = Ingredient.create!(name: "Avocado",
                                  calories: 120)
    @toast   = Ingredient.create!(name: "Toasted Multigrain Bread",
                                  calories: 180)
    @egg     = Ingredient.create!(name: "Hardboiled Egg",
                                  calories: 90)
@dish_ing_1  = DishIngredient.create!(dish_id: @dish.id,
                                      ingredient_id: @avocado.id)
@dish_ing_2  = DishIngredient.create!(dish_id: @dish.id,
                                      ingredient_id: @toast.id)
@dish_ing_3  = DishIngredient.create!(dish_id: @dish.id,
                                      ingredient_id: @egg.id)

  expect(@dish.total_calories).to eq(390)
  end
end
