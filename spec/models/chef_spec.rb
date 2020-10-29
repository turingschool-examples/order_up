require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it { should have_many(:ingredients).through(:dishes) }
  end
  describe "intance methods" do
    it "#unique_ingredients" do
      chef = Chef.create!(name: "Bob Newhart")
      dish_1 = Dish.create!(
        name: "Spaghetti",
        description: "Spaghetti and Meatballs",
        chef_id: chef.id
      )
      dish_2 = Dish.create!(
        name: "Hot Dogs Marinara",
        description: "Hot Dog with bun covered in marinara",
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
      hot_dog = Ingredient.create!(
        name: "Hot Dog",
        calories: 400
      )
      bun = Ingredient.create!(
        name: "Bun",
        calories: 150
      )
      DishIngredient.create!(
        dish_id: dish_1.id,
        ingredient_id: pasta.id
      )
      DishIngredient.create!(
        dish_id: dish_1.id,
        ingredient_id: sauce.id
      )
      DishIngredient.create!(
        dish_id: dish_1.id,
        ingredient_id: meatballs.id
      )
      DishIngredient.create!(
        dish_id: dish_2.id,
        ingredient_id: hot_dog.id
      )
      DishIngredient.create!(
        dish_id: dish_2.id,
        ingredient_id: bun.id
      )
      DishIngredient.create!(
        dish_id: dish_2.id,
        ingredient_id: sauce.id
      )

      expect(chef.unique_ingredients).to eq([pasta, sauce, meatballs, hot_dog, bun])
      expect(chef.unique_ingredients).to_not eq(chef.ingredients)
    end
  end
end
