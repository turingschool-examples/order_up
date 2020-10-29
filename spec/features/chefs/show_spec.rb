require 'rails_helper'

describe 'As a visitor, when I visit a chef show page' do
  it "I see the chef's name, and a link the chef's ingredient index page with all chef ingredients" do
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

    visit "/chefs/#{julia.id}"
# save_and_open_page
    expect(page).to have_content(julia.name)

    click_link("Julia Child Ingredient List")

    expect(current_path).to eq("/chefs/#{julia.id}/ingredients")

    expect(page).to have_content("Chicken")
    expect(page).to have_content("Mozzerella")
    expect(page).to have_content("Tomato Sauce")
    expect(page).to have_content("Egg")
    expect(page).to have_content("Bread")
    expect(page).to have_content("Maple Syrup")
    # test unique?
  end
end
