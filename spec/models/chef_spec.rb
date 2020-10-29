require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "can find all chef's unique ingredients" do
      @chef    = Chef.create!(name: "Gordon Ramsay")
      @dish    = Dish.create!(name: "Avocado and Egg Toast",
                          description: "Smashed avocado toast with hardboiled eggs.",
                          chef_id: @chef.id)
      @avocado = Ingredient.create!(name: "Avocado",
                                calories: 120)
      @bread   = Ingredient.create!(name: "White Bread",
                                calories: 150)
      @egg     = Ingredient.create!(name: "Hardboiled Egg",
                                calories: 90)
  @dish_ing_1  = DishIngredient.create!(dish_id: @dish.id,
                                    ingredient_id: @avocado.id)
  @dish_ing_2  = DishIngredient.create!(dish_id: @dish.id,
                                    ingredient_id: @bread.id)
  @dish_ing_3  = DishIngredient.create!(dish_id: @dish.id,
                                    ingredient_id: @egg.id)
      @dish_2  = Dish.create!(name: "Avocado and Egg Toast",
                          description: "Smashed avocado toast with hardboiled eggs.",
                          chef_id: @chef.id)
      @pb      = Ingredient.create!(name: "Peanut Butter",
                                calories: 80)
      @jelly   = Ingredient.create!(name: "Grape Jelly",
                                calories: 220)
      @bread   = Ingredient.create!(name: "White Bread",
                                calories: 150)
    @dish_ing_4  = DishIngredient.create!(dish_id: @dish_2.id,
                                    ingredient_id: @pb.id)
    @dish_ing_5  = DishIngredient.create!(dish_id: @dish_2.id,
                                    ingredient_id: @jelly.id)
    @dish_ing_6  = DishIngredient.create!(dish_id: @dish_2.id,
                                    ingredient_id: @bread.id)

    expected = [@avocado, @bread, @egg, @pb, @jelly]

    expect(@chef.unique_ingredients).to eq(expected)
    end
  end
end
