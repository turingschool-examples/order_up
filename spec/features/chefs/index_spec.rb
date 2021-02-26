require 'rails_helper'

RSpec.describe 'Chef Ingredient Index page' do
  before :each do
    @chef = Chef.create(name: "Swedish Chef")
    @dish = @chef.dishes.create(name: "Orgabork", description: "Bork Bork Bork")
    @dish2 = @chef.dishes.create(name: "Bork", description: "mmmm Bork Bork")
    @ingredient1 = @dish.ingredients.create(name: "Chicken", calories: 50)
    @ingredient2 = @dish.ingredients.create(name: "Fish", calories: 50)
    @ingredient3 = @dish2.ingredients.create(name: "Onion", calories: 25)
    @ingredient4 = @dish2.ingredients.create(name: "Leek", calories: 25)
  end
  it "displays the names of all ingredients used by the chef" do
    visit "/chefs/#{@chef.id}/ingredients"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
  end
end
