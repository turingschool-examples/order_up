require "rails_helper"

RSpec.describe "Dish Show Page" do

  before(:each) do
    @chef = Chef.create!(name: "Enrique Olvera")
    @tinga = @chef.dishes.create!(name: "Tinga de Pollo", description: "It can be a soupy stew served over white rice and with tortillas.")
    @ingredient1 = Ingredient.create!(name: "Boneless chicken breast", calories: 500)
    @ingredient2 = Ingredient.create!(name: "4 dried/canned chipotle chiles", calories: 80)
    @ingredient3 = Ingredient.create!(name: "9 plum tomatoes", calories: 198)
    DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient1.id)
    DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient2.id)
    DishIngredient.create!(dish_id: @tinga.id, ingredient_id: @ingredient3.id)
  end

  it "displays a list of ingredients and the chef's name." do

    visit "/dishes/#{@tinga.id}"

    expect(page).to have_content(@tinga.name)
    expect(page).to have_content("The #{@chef.name} edition")
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end

  it "displays the total calorie count for the dish." do

    visit "/dishes/#{@tinga.id}"

    expect(page).to have_content("Total Calorie Count: #{@tinga.total_calories}")
  end

end
