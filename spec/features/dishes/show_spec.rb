require 'rails_helper'

describe 'When I visit a dish show page as a visitor' do
  it 'I see the dish name, description, ingredient list, and chef' do
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

    visit "/dishes/#{chicken_parm.id}"

    expect(page).to have_content(chicken_parm.name)
    expect(page).to have_content(chicken_parm.description)
    expect(page).to have_content(chicken.name)
    expect(page).to have_content(mozzerella.name)
    expect(page).to have_content(sauce.name)
    expect(page).to have_content(julia.name)
  end

  it 'I see the total calorie count for that dish' do
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

    visit "/dishes/#{chicken_parm.id}"

    expect(page).to have_content("Total Calories: 440")
  end
end
