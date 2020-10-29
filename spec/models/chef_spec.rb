require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :dishes }
    it { should have_many(:ingredients).through(:dishes) }
  end

  describe "instance methods" do
    it '#unique_ingredients' do
      julia = Chef.create!(name: "Julia Child")
      chicken_parm = Dish.new(
        name: "Chicken Parmesan",
        description: "Cheesy breaded chicken",
        chef: julia
      )
      chicken = Ingredient.create!(
        name: "Chicken",
        calories: "200"
      )
      mozzerella = Ingredient.create!(
        name: "Mozzerella",
        calories: "150"
      )
      sauce = Ingredient.create!(
        name: "Tomato Sauce",
        calories: "90"
      )
      egg = Ingredient.create!(
        name: "Egg",
        calories: 78
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: chicken
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: mozzerella
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: sauce
      )
      Recipe.create!(
        dish: chicken_parm,
        ingredient: egg
      )
      french_toast = Dish.new(
        name: "French Toast",
        description: "Custardy bread with syrup",
        chef: julia
      )
      bread = Ingredient.create!(
        name: "Bread",
        calories: 120
      )
      syrup = Ingredient.create!(
        name: "Maple Syrup",
        calories: 150
      )
      Recipe.create!(
        dish: french_toast,
        ingredient: egg
      )
      Recipe.create!(
        dish: french_toast,
        ingredient: bread
      )
      Recipe.create!(
        dish: french_toast,
        ingredient: syrup
      )

      expected = [chicken, mozzerella, sauce, egg, bread, syrup]

      expect(julia.unique_ingredients).to eq(expected)
    end
  end
end
