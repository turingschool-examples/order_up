require 'rails_helper'

RSpec.describe 'Dishes' do
  it 'can show the name, description, list of ingredients and the chefs name' do
    @chef = Chef.create!(name: 'Lasondra')
    @dish = @chef.dishes.create!(name: 'Meatballs', description: 'Beef in Marinera')

    visit "dishes/#{@dish.id}"
    expect(page).to have_content("Meatballs")
    expect(page).to have_content("Beef in Marinera")
    expect(page).to have_content("Chef: Lasondra")
  end
end
