require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    describe "#dish_information" do
      it "shows a dish's ingredients and chef's name" do
        chef_1 = Chef.create!(name: "Chef")
        dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
        ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
        ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
        ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
        dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
        dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
        dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)

        expected = dish_1.dish_information.map do |ingred|
                    ingred.name
                  end

        expect(expected).to eq(["Cheese", "Dough", "Marinara"])
      end
    end
  end

  describe "#calorie_calculation" do
    it "calculates the total calories in a dish" do
      chef_1 = Chef.create!(name: "Chef")
      dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
      ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
      ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
      ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
      dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
      dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
      dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)

      expect(dish_1.calorie_calculation).to eq(850)
    end
  end
end



# it "shows dishes name and description"
#   chef_1 = Chef.create!(name: "Chef")
#   dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: "#{chef_1.id}" )
#
#   expect(dish_1.dish_information).to eq("Pizza", "Tasty")
#
# end

# create_table "chefs", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "dish_ingredients", force: :cascade do |t|
#   t.bigint "dish_id"
#   t.bigint "ingredient_id"
#   t.index ["dish_id"], name: "index_dish_ingredients_on_dish_id"
#   t.index ["ingredient_id"], name: "index_dish_ingredients_on_ingredient_id"
# end
#
# create_table "dishes", force: :cascade do |t|
#   t.string "name"
#   t.string "description"
#   t.bigint "chef_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["chef_id"], name: "index_dishes_on_chef_id"
# end
#
# create_table "ingredients", force: :cascade do |t|
#   t.string "name"
#   t.integer "calories"
