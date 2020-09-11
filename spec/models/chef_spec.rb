require "rails_helper"

RSpec.describe Chef do

  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do

    it "#unique_ingredients" do
      @chef = Chef.create!(name: "Enrique Olvera")

      @tinga = @chef.dishes.create!(name: "Tinga de Pollo", description: "It can be a soupy stew served over white rice and with tortillas.")
      @puchero = @chef.dishes.create!(name: "Grandmother's Puchero", description: "A soup made with vegetables and cheap cuts of meat.")

      @ingredient1 = Ingredient.create!(name: "Boneless chicken breast", calories: 500)
      @ingredient2 = Ingredient.create!(name: "4 dried/canned chipotle chiles", calories: 80)
      @ingredient3 = Ingredient.create!(name: "9 plum tomatoes", calories: 198)

      DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient1.id)
      DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient2.id)
      DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient3.id)

      DishIngredient.create!(dish_id: @puchero.id, ingredient_id: @ingredient1.id)
      DishIngredient.create!(dish_id: @puchero.id, ingredient_id: @ingredient3.id)

      expect(@chef.unique_ingredients).to eq(["4 dried/canned chipotle chiles", "9 plum tomatoes", "Boneless chicken breast"])
    end
  end

end
