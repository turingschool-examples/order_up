require 'rails_helper'

RSpec.describe "As a visitor when I visit '/chefs/:id'", type: :feature do 
  it "can see the name of the chef" do 
    ramsey = Chef.create!(name: "Gordon Ramsey")
    remy = Chef.create!(name: "Remy Gusteau")
    linguini = Chef.create!(name: "Alfredo Linguini")

    visit "/chefs/#{ramsey.id}"

    within "#chefs-#{ramsey.id}" do 
    expect(page).to have_content("#{ramsey.name}")
    end
    visit "/chefs/#{remy.id}"

    within "#chefs-#{remy.id}" do 
    expect(page).to have_content("#{remy.name}")
    end
  end
  it "can see a list of ingredients that the chef uses in their dishes and link to the ingredient index" do 
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

    visit "/chefs/#{ramsey.id}"

    within "#chefs-#{ramsey.id}" do 
    expect(page).to have_content("#{ramsey.ingredients.name}")
    end
  end
end

# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses