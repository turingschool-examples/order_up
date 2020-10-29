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

  describe "Instance Methods" do
    it "Calorie Count Method" do
      bob = Chef.create!(name: "Bob")
      pasta = Dish.create!(name: "Pasta", description: "Noodle Dish", chef_id: bob.id)
      noodles = Ingredient.create!(name: "Noodles", calories: 50)
      sause = Ingredient.create!(name: "Sause", calories: 100)
      meatballs = Ingredient.create!(name: "Meatballs", calories: 150)

      DishIngredient.create!(dish_id: pasta.id, ingredient_id: noodles.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: sause.id)
      DishIngredient.create!(dish_id: pasta.id, ingredient_id: meatballs.id)

      expect(Dish.calorie_count(pasta)).to eq(300)
    end
  end
end
