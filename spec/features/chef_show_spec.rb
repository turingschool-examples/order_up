require 'rails_helper'

RSpec.describe "chef show page", type: :feature do

  it "shows name of chef" do

    chef = Chef.create!(name: "Bobby Bones")
    pizza = Dish.create!(name: "Pizza", description: "Very yummy pizza pie!", calories: 3000, chef_id: chef.id)
    dough = Ingredient.create!(name: "Pizza dough")
    sauce = Ingredient.create!(name: "Pizza sauce")
    cheese = Ingredient.create!(name: "Mozzarella")
    pepperoni = Ingredient.create!(name: "Pepperoni")
    pizza.ingredients << dough
    pizza.ingredients << sauce
    pizza.ingredients << cheese
    pizza.ingredients << pepperoni
    visit "chefs/#{chef.id}"
    expect(page).to have_content(chef.name)
  end

  it "has link to ingredients" do

    chef = Chef.create!(name: "Bobby Bones")
    pizza = Dish.create!(name: "Pizza", description: "Very yummy pizza pie!", calories: 3000, chef_id: chef.id)
    dough = Ingredient.create!(name: "Pizza dough")
    sauce = Ingredient.create!(name: "Pizza sauce")
    cheese = Ingredient.create!(name: "Mozzarella")
    pepperoni = Ingredient.create!(name: "Pepperoni")
    pizza.ingredients << dough
    pizza.ingredients << sauce
    pizza.ingredients << cheese
    pizza.ingredients << pepperoni
    visit "chefs/#{chef.id}"
    expect(page).to have_link("Ingredients")
  end

  it "can click on and display ingredients" do

    chef = Chef.create!(name: "Bobby Bones")
    pizza = Dish.create!(name: "Pizza", description: "Very yummy pizza pie!", calories: 3000, chef_id: chef.id)
    dough = Ingredient.create!(name: "Pizza dough")
    sauce = Ingredient.create!(name: "Pizza sauce")
    cheese = Ingredient.create!(name: "Mozzarella")
    pepperoni = Ingredient.create!(name: "Pepperoni")
    pizza.ingredients << dough
    pizza.ingredients << sauce
    pizza.ingredients << cheese
    pizza.ingredients << pepperoni
    visit "chefs/#{chef.id}"
    click_on "Ingredients"
    save_and_open_page
    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    expect(page).to have_content(dough.name)
    expect(page).to have_content(sauce.name)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(pepperoni.name)

  end

end
