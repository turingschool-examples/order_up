require "rails_helper"

RSpec.describe "Chef Ingredients Show Page" do

  before(:each) do
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
  end

  it "displays a list of ingredients and the chef's name." do

    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    expect(page).to have_link("List of Ingredients")
    click_on "List of Ingredients"

    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

    expect(page).to have_content("Ingredients Used by the One and Only #{@chef.name}")
    expect(page).to have_content(@ingredient1.name, count: 1)
    expect(page).to have_content(@ingredient2.name, count: 1)
    expect(page).to have_content(@ingredient3.name, count: 1)
  end

end
