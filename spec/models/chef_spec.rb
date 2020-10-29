require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "instance methods" do
    it "#unique_ingredients" do
      chef = Chef.create!(name: "Yevhen Klopotenko")

      dish_1 = Dish.create!(name: "Borscht",
                          description: "One of the most famous dishes of Ukrainian cuisine, made with beetroots as one of the main ingredients, which give the dish its distinctive red color.",
                          chef_id: chef.id)

      dish_2 = Dish.create!(name: "Falafel",
                          description: "Falafel is a deep-fried ball or patty made from ground chickpeas, fava beans, or both.",
                          chef_id: chef.id)

      ingredient_1 = Ingredient.create!(name: "Beet",
                                        calories: 59)

      ingredient_2 = Ingredient.create!(name: "Yukon Potato",
                                        calories: 110)

      ingredient_3 = Ingredient.create!(name: "Carrot",
                                        calories: 25)

      ingredient_4 = Ingredient.create!(name: "Dried chickpeas",
                                        calories: 269)

      ingredient_5 = Ingredient.create!(name: "Onion",
                                        calories: 44)

      ingredient_6 = Ingredient.create!(name: "Carrot",
                                        calories: 25)

      DishIngredient.create!(dish_id: dish_1.id,
                             ingredient_id: ingredient_1.id)

      DishIngredient.create!(dish_id: dish_1.id,
                             ingredient_id: ingredient_2.id)

      DishIngredient.create!(dish_id: dish_1.id,
                             ingredient_id: ingredient_3.id)

      DishIngredient.create!(dish_id: dish_2.id,
                             ingredient_id: ingredient_4.id)

      DishIngredient.create!(dish_id: dish_2.id,
                             ingredient_id: ingredient_5.id)

      DishIngredient.create!(dish_id: dish_2.id,
                             ingredient_id: ingredient_6.id)

      expect(chef.unique_ingredients.length).to eq(5)
    end
  end
end
