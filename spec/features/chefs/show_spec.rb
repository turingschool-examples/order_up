require 'rails_helper'

describe 'Chef Show Page' do
  before :each do
    @chef = Chef.create(name: "Gordan")
    @dish = @chef.dishes.create(name: "Pizza", description: "Tasty")
    @dish3 = @chef.dishes.create(name: "Burger", description: "Tasty")
    @dish2 = @chef.dishes.create(name: "Pizza 2", description: "Tasty")
    @ingredient1 = @dish.ingredients.create(name: "Sauce", calories: 40)
    @ingredient2 = @dish.ingredients.create(name: "Crust", calories: 100)
    @ingredient3 = @dish.ingredients.create(name: "Cheese", calories: 100)
    @ingredient7 = @dish2.ingredients.create(name: "Sauce", calories: 40)
    @ingredient8 = @dish2.ingredients.create(name: "Crust", calories: 100)
    @ingredient9 = @dish2.ingredients.create(name: "Cheese", calories: 100)
    @ingredient4 = @dish3.ingredients.create(name: "Lettuce", calories: 90)
    @ingredient5 = @dish3.ingredients.create(name: "Chicken", calories: 90)
    @ingredient6 = @dish3.ingredients.create(name: "Bread", calories: 90)
  end

  it 'sees Chef Name' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    click_link 'Ingredients'
  end

  it 'sees Chefs favorite ingredeints' do
    visit "/chefs/#{@chef.id}"
    save_and_open_page
    expect(page).to have_content(@chef.favorite_ingredients)
  end
end
