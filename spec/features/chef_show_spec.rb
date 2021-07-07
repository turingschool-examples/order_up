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
    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    expect(page).to have_content(dough.name)
    expect(page).to have_content(sauce.name)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(pepperoni.name)

  end

  # it "can display three most popular ingredients" do
  #
  #   chef = Chef.create!(name: "Bobby Bones")
  #   pizza = Dish.create!(name: "Pizza", description: "Very yummy pizza pie!", calories: 3000, chef_id: chef.id)
  #   dough = Ingredient.create!(name: "Pizza dough")
  #   sauce = Ingredient.create!(name: "Pizza sauce")
  #   cheese = Ingredient.create!(name: "Mozzarella")
  #   pepperoni = Ingredient.create!(name: "Pepperoni")
  #   pizza.ingredients << dough
  #   pizza.ingredients << sauce
  #   pizza.ingredients << cheese
  #   pizza.ingredients << pepperoni
  #   spaghetti = Dish.create!(name: "Spaghetti", description: "Very yummy dish!", calories: 5000, chef_id: chef.id)
  #   pasta = Ingredient.create!(name: "Pasta")
  #   mushrooms = Ingredient.create!(name: "Mushrooms")
  #   spaghetti.ingredients << pasta
  #   spaghetti.ingredients << mushrooms
  #   spaghetti.ingredients << sauce
  #   spaghetti.ingredients << cheese
  #   pizza.ingredients << mushrooms
  #   garlic_mushrooms = Dish.create!(name: "Garlic Mushrooms", description: "Very yummy dish!", calories: 5000, chef_id: chef.id)
  #   garlic = Ingredient.create!(name: "Garlic")
  #   garlic_mushrooms.ingredients << garlic
  #   garlic_mushrooms.ingredients << cheese
  #   garlic_mushrooms.ingredients << mushrooms
  #   cheese_sticks = Dish.create!(name: "Cheese Sticks", description: "Very yummy dish!", calories: 5000, chef_id: chef.id)
  #   cheese_sticks.ingredients << cheese
  #   visit "chefs/#{chef.id}"
  #   click_on "Ingredients"
  #   within('#top-3') do
  #     expect(page).to have_content(cheese.name)
  #     expect(page).to have_content(mushrooms.name)
  #     expect(page).to have_content(sauce.name)
  #   end
  # end

end
