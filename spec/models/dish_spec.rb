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
    it "total_calorie_count" do
      franc = Chef.create!(name: "Francois Francesco")
      ratatouille = franc.dishes.create!(
                                          name: "Ratatouille",
                                          description: "Spicy and delicious!"
                                        )
      egg = Ingredient.create!(name: "eggplant", calories: 100)
      tomato = Ingredient.create!(name: "tomato", calories: 80)
      zucc = Ingredient.create!(name: "zucchini", calories: 120)

      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: egg.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: tomato.id)
      DishIngredient.create!(dish_id: ratatouille.id, ingredient_id: zucc.id)

      expect(ratatouille.total_calorie_count).to eq(300)
    end
  end
end
