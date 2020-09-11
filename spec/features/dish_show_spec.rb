require 'rails_helper'

RSpec.describe "dish show page", type: :feature do

  it "can see dish's attributes including name, description, ingredients and chef" do

    chef = Chef.create!(name: "Bobby Bones")
    pizza = Dish.create!(name: "Pizza", description: "Very yummy pizza pie!", chef_id: chef.id)
    dough = Ingredient.create!(name: "Pizza dough")
    sauce = Ingredient.create!(name: "Pizza sauce")
    cheese = Ingredient.create!(name: "Mozzarella")
    pepperoni = Ingredient.create!(name: "Pepperoni")
    pizza.ingredients << dough
    pizza.ingredients << sauce
    pizza.ingredients << cheese
    pizza.ingredients << pepperoni
    visit "/pizza"
    expect(page).to have_content(pizza.name)
    expect(page).to have_content(chef.name)
    expect(page).to have_content(dough.name)
    expect(page).to have_content(sauce.name)
    expect(page).to have_content(pepperoni.name)
    expect(page).to have_content(cheese.name)
  end

end
