require 'rails_helper'

RSpec.describe 'When I visit a chefs show page' do
  it 'shows the chefs name, a show ingredients link' do

    emeril = Chef.create(name: "Emeril Legasse")

    visit "/chefs/#{emeril.id}"
    expect(page).to have_content("#{emeril.name}")
    expect(page).to have_link("Ingredient List")

  end

  it "shows an index of all ingredients used by the chef" do
    emeril = Chef.create(name: "Emeril Legasse")

    red_sauce = Ingredient.create(name: "Red Sauce", calories: 200)
    beef = Ingredient.create(name: "Ground Beef", calories: 500)
    ricotta = Ingredient.create(name: "Ricotta", calories: 700)
    ham = Ingredient.create(name: "Ham", calories: 600)
    lentils = Ingredient.create(name: "Lentils", calories: 150)
    parsley = Ingredient.create(name: "Parsley", calories: 20)
    mozz = Ingredient.create(name: "Mozzarella", calories: 650)
    oregano = Ingredient.create(name: "Oregano", calories: 10)

    lasagna = emeril.dishes.create(name: "Lasagna", description: "A nice layered pasta with red sauce, ricotta, and ground beef" )
    DishIngredient.create(ingredient_id: red_sauce.id, dish_id: lasagna.id)
    DishIngredient.create(ingredient_id: beef.id, dish_id: lasagna.id)
    DishIngredient.create(ingredient_id: ricotta.id, dish_id: lasagna.id)

    wedding_soup = emeril.dishes.create(name: "Wedding Soup", description: "A warm bowl of deliciousness" )
    DishIngredient.create(ingredient_id: ham.id, dish_id: wedding_soup.id)
    DishIngredient.create(ingredient_id: lentils.id, dish_id: wedding_soup.id)
    DishIngredient.create(ingredient_id: parsley.id, dish_id: wedding_soup.id)

    visit "/chefs/#{emeril.id}"

    click_link("Ingredient List")

    expect(page).to have_content("#{red_sauce.name}")
    expect(page).to have_content("#{beef.name}")
    expect(page).to have_content("#{ricotta.name}")
    expect(page).to have_content("#{ham.name}")
    expect(page).to have_content("#{lentils.name}")
    expect(page).to have_content("#{parsley.name}")


  end
end
