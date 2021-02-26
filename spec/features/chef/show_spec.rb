require 'rails_helper'

RSpec.describe 'Chef show page', type: :feature do
  before :each do
    @chef = Chef.create!(name: "Billy bob")

    @dish_1 = @chef.dishes.create!(name: "Salad", description: "Super healthy")
    @dish_2 = @chef.dishes.create!(name: "Spaghetti", description: "Rich and filling")

    @ingredient_1 = Ingredient.create!(name: "Spinach", calories: 25)
    @ingredient_2 = Ingredient.create!(name: "Feta cheese", calories: 50)
    @ingredient_3 = Ingredient.create!(name: "Tomatoes", calories: 15)
    @ingredient_4 = Ingredient.create!(name: "Pasta", calories: 75)
    @ingredient_5 = Ingredient.create!(name: "Mozzarella", calories: 30)

    @d1_i1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    @d1_i2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    @d1_i3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

    @d2_i3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
    @d2_i4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
    @d2_i5 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
  end

  it 'Displays chefs name and a link to their ingredients' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    expect(page).to have_link("Ingredents they use")
  end

  it 'Links takes you to unique list of chefs ingredients' do
    visit "/chefs/#{@chef.id}"

    click_on "Ingredents they use"

    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

    within("#ingredients") do
      expect(page).to have_content(@ingredient_1.name, count: 1)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to have_content(@ingredient_5.name)
    end
  end
end
