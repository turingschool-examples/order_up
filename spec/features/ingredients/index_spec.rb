require 'rails_helper'

describe 'Ingredients Index Page' do
  before :each do
    @chef = Chef.create(name: "Gordan")
    @dish = @chef.dishes.create(name: "Pizza", description: "Tasty")
    @ingredient1 = @dish.ingredients.create(name: "Sauce", calories: 40)
    @ingredient2 = @dish.ingredients.create(name: "Crust", calories: 100)
    @ingredient3 = @dish.ingredients.create(name: "Cheese", calories: 90)
  end

  it 'sees All Ingredients' do
    visit "/chefs/#{@chef.id}/ingredients"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end
end
