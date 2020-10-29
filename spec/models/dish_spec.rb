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
    it "#total_calories" do
      chef = Chef.create!(name: "Yevhen Klopotenko")

      dish = Dish.create!(name: "Borscht",
                          description: "One of the most famous dishes of Ukrainian cuisine, made with beetroots as one of the main ingredients, which give the dish its distinctive red color.",
                          chef_id: chef.id)

      ingredient_1 = Ingredient.create!(name: "Beet",
                                        calories: 59)

      ingredient_2 = Ingredient.create!(name: "Yukon Potato",
                                        calories: 110)

      ingredient_3 = Ingredient.create!(name: "Carrot",
                                        calories: 25)

      DishIngredient.create!(dish_id: dish.id,
                             ingredient_id: ingredient_1.id)

      DishIngredient.create!(dish_id: dish.id,
                             ingredient_id: ingredient_2.id)

      DishIngredient.create!(dish_id: dish.id,
                             ingredient_id: ingredient_3.id)

      expect(dish.total_calories).to eq(194)
    end
  end
end
