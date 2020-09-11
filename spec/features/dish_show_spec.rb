require 'rails_helper'

RSpec.describe "dish show page", type: :feature do

  it "can see dish's attributes including name, description, ingredients and chef" do

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
    visit "dishes/#{pizza.id}"
    expect(page).to have_content(pizza.name)
    expect(page).to have_content(pizza.description)
    expect(page).to have_content(chef.name)
    expect(page).to have_content(dough.name)
    expect(page).to have_content(sauce.name)
    expect(page).to have_content(pepperoni.name)
    expect(page).to have_content(cheese.name)
  end

  it "can show calorie count" do
    chef = Chef.create!(name: "Bobby Bones")
    pizza = Dish.create!(name: "Death by Pizza", calories: 27999, description: "Eat the whole thing and win pizza for life! (Disclaimer: Bobby Bones not responsible for cardiac arrests that happen within 45 days of consumption!)", chef_id: chef.id)
    dough = Ingredient.create!(name: "Pizza dough")
    sauce = Ingredient.create!(name: "Pizza sauce")
    cheese = Ingredient.create!(name: "Mozzarella")
    pepperoni = Ingredient.create!(name: "Pepperoni")
    pizza.ingredients << dough
    pizza.ingredients << sauce
    pizza.ingredients << cheese
    pizza.ingredients << pepperoni
    visit "dishes/#{pizza.id}"
    expect(page).to have_content("Calorie count: #{pizza.calories}")

  end

end
