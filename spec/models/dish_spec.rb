require "rails_helper"

RSpec.describe Dish do

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "class methods" do

    it "#total_calories" do
      @chef = Chef.create!(name: "Enrique Olvera")
      @tinga = @chef.dishes.create!(name: "Tinga de Pollo", description: "It can be a soupy stew served over white rice and with tortillas.")
      @ingredient1 = Ingredient.create!(name: "Boneless chicken breast", calories: 500)
      @ingredient2 = Ingredient.create!(name: "4 dried/canned chipotle chiles", calories: 80)
      @ingredient3 = Ingredient.create!(name: "9 plum tomatoes", calories: 198)
      DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient1.id)
      DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient2.id)
      DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient3.id)

      expect(@tinga.total_calories).to eq(778)
    end
    
  end

end
