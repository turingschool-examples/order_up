require 'rails_helper'

RSpec.describe "chef show page" do
  before(:each) do
    @chef = Chef.create!(name: "Tim")
    @mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')
    @pasta = @mac.ingredients.create!(name: 'pasta', calories: 1000)
    @cheese = @mac.ingredients.create!(name: 'cheese', calories: 100)
  end

  it 'shows chef name' do
    visit chef_path(@chef)

    expect(page).to have_content(@chef.name)
  end
  it 'links to chef ingredients page' do
    visit chef_path(@chef)

    click_link 'view this chefs ingredients'

    expect(current_path).to eq(chef_ingredients_path(@chef))
  end

end

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
