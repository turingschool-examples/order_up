require "rails_helper"

RSpec.describe DishIngredient, type: :model do
  describe "relationships" do
    it { should belong_to :dish }
    it { should belong_to :ingredient }
  end

  # describe "#remove_ingredient" do
  #   it "removes an ingredient from the dish" do
  #     chef_1 = Chef.create!(name: "Chef")
  #     dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
  #     ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
  #     ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
  #     ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
  #     dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
  #     dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
  #     dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)
  #
  #     expected = dish_1.remove_ingredient(ingred_3.id)
  #
  #       # expected =  dish_1.remove_ingredient.map do |ingred|
  #                 #               ingred
  #                 #             end
  #
  #     expect(expected).to eq(["Cheese", "Dough"])
  #   end
  # end
end
