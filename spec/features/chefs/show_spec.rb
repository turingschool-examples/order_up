require 'rails_helper'

describe 'Chef Show Page' do
  before :each do
    @chef = Chef.create(name: "Gordan")
    @dish = @chef.dishes.create(name: "Pizza", description: "Tasty")
    @ingredient1 = @dish.ingredients.create(name: "Sauce", calories: 40)
    @ingredient2 = @dish.ingredients.create(name: "Crust", calories: 100)
    @ingredient3 = @dish.ingredients.create(name: "Cheese", calories: 90)
  end

  it 'sees Chef Name' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    click_link 'Ingredients'
  end
end
