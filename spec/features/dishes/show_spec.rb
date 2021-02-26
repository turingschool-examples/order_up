require 'rails_helper'
describe 'Dishs show spec' do
  before :each do
    @chef = Chef.create(name: "Bob")
    @dish = @chef.dishes.create(name: 'Pasta', description: 'Taste good')
    @ingredient1 = @dish.ingredients.create(name: 'oregano', calories: 0)
    @ingredient2 = @dish.ingredients.create(name: 'butter', calories: 10)
  end

  it 'shows dish name and attributes' do
    visit dish_path(@dish)

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to have_content(@chef.name)
  end

  it 'lists ingredients for that dish' do
    visit dish_path(@dish)

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content("Dish's Total Calories: 10")
  end
end