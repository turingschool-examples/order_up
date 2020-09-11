require 'rails_helper'

RSpec.describe 'Dishes' do
  it 'can show the name, description, list of ingredients and the chefs name' do
    @chef = Chef.create!(name: 'Lasondra')
    @dish = @chef.dishes.create!(name: 'Meatballs', description: 'Beef in Marinera')
    @ingredient_1 = @dish.ingredients.create!(name: "Beef", calories: 200)
    @dish.ingredients.create!(name: 'Marinera', calories: 150)

    visit "dishes/#{@dish.id}"
    expect(page).to have_content("Meatballs")
    expect(page).to have_content("Beef in Marinera")
    expect(page).to have_content("Chef: Lasondra")

    expect(page).to have_content('Ingredients:')
    expect(page).to have_content('Beef')
    expect(page).to have_content('Marinera')
  end
  it 'shows total calories for the dish' do
    @chef = Chef.create!(name: 'Lasondra')
    @dish = @chef.dishes.create!(name: 'Meatballs', description: 'Beef in Marinera')
    @ingredient_1 = @dish.ingredients.create!(name: "Beef", calories: 200)
    @dish.ingredients.create!(name: 'Marinera', calories: 150)

    visit "dishes/#{@dish.id}"
    expect(page).to have_content("Total Calories: 350")
  end
end
