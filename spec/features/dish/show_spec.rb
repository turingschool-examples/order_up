require 'rails_helper'

RSpec.describe "As a visitor when I visit '/dish/:id'", type: :feature do 
  it "can see the name and description of a dish and I see a lisy of ingredients and the chef's name" do 
    ramsey = Chef.create!(name: "Gordon Ramsey")
    remy = Chef.create!(name: "Remy Gusteau")
    linguini = Chef.create!(name: "Alfredo Linguini")

    pizza = Dish.create!(name: "Supreme", description: "great food", chef_id: ramsey.id )
    pbj = Dish.create!(name: "Peanutbutter and Jelly Sandwich", description: "simple and delicious", chef_id: remy.id)
    blt = Dish.create!(name: "BLT Sandwich", description: "tasty and delicious", chef_id: remy.id)
    tamales = Dish.create!(name: "Tamales", description: "Comes in various flavors", chef_id: linguini.id)

    ingredient1 = pizza.ingredients.create!(name: "tomato sauce", calories: 45)
    ingredient2 = pbj.ingredients.create!(name: "penut butter", calories: 60)
    ingredient3 = tamales.ingredients.create!(name: "chili sauce", calories: 10)
    ingredient4 = tamales.ingredients.create!(name: "dough" , calories: 75)
    ingredient5 = pbj.ingredients.create!(name: "bread" , calories: 27)

    visit "/dishes/#{pizza.id}"

    within "dish-#{pizza.id}" do 
    expect(page).to have_content("#{pizza.name}")
    expect(page).to have_content("#{pizza.description}")
    expect(page).to have_content("#{ingredient1.id}")
    expect(page).to have_content("#{ramsey.id}")
    end
  end 
end

# And I see a list of ingredients for that dish
# And I see the chef's name
