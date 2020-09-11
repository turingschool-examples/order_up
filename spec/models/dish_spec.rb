require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
  end

  def test_it_can_count_calories
    @chef = Chef.create!(name: 'Phil')

    @dish = @chef.dishes.create!(name: 'Grilled Cheese', description: 'Gooey cheese bread')

    @ingredient_1 = Ingredient.create!(name: "Slice Smoked Cheddar", calories: 150)
    @ingredient_2 = Ingredient.create!(name: "2 Slices Sourdough Bread", calories: 200)
    @ingredient_3 = Ingredient.create!(name: "Tbs Butter", calories: 100)

    @dish_ingredient_1 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_1)
    @dish_ingredient_2 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_2)
    @dish_ingredient_3 = DishIngredient.create!(dish: @dish, ingredient: @ingredient_3)

    assert_equal 450, @dish.calorie_count
  end
end
