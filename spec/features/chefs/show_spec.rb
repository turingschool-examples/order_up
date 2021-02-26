require 'rails_helper'
describe 'Chef show spec' do
  before :each do
    @chef = Chef.create(name: "Bob")
    @dish = @chef.dishes.create(name: 'Pasta', description: 'Taste good')
    @dish2 = @chef.dishes.create(name: 'Salmon', description: 'Taste good')
    @ingredient1 = @dish.ingredients.create(name: 'oregano', calories: 0)
    @ingredient1 = @dish2.ingredients.create(name: 'oregano', calories: 0)
    @ingredient2 = @dish.ingredients.create(name: 'butter', calories: 10)
    @ingredient2 = @dish2.ingredients.create(name: 'butter', calories: 10)
  end

  it 'see chefs name and link to all ingredients that chef uses' do
    visit chef_path(@chef)

    expect(page).to have_content(@chef.name)
    expect(page).to have_link("Ingredients")
    click_link('Ingredients')

    expect(current_path).to eq(chef_ingredients_path)
  end
end