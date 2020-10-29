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
    it "#total_calories" do
      chef = Chef.create!(name: "Bob Newhart")
      dish = Dish.create!(
        name: "Spaghetti",
        description: "Spaghetti and Meatballs",
        chef_id: chef.id
      )
      pasta = Ingredient.create!(
        name: "Pasta",
        calories: 150
      )
      sauce = Ingredient.create!(
        name: "Marinara Sauce",
        calories: 75
      )
      meatballs = Ingredient.create!(
        name: "Meatballs",
        calories: 300
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: pasta.id
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: sauce.id
      )
      DishIngredient.create!(
        dish_id: dish.id,
        ingredient_id: meatballs.id
      )

      expect(dish.total_calories).to eq(525)
    end
  end
end
