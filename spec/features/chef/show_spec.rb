# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

require 'rails_helper'

RSpec.describe 'When I visit a chefs show page' do
  before :each do
    @dani = Chef.create(name: "Dani Coleman")

    salad = @dani.dishes.create(name: "Salad", description: "Refreshing")
    skinny = @dani.dishes.create(name: "Skinny", description: "Hearty")
    cw = @dani.dishes.create(name: "Cauliflower Wings", description: "Delish")

    @lettuce = skinny.ingredients.create(name: "Lettuce", calories: 40)
    @hb = skinny.ingredients.create(name: "Hashbrowns", calories: 100)
    cauli = cw.ingredients.create(name: "Cauliflower", calories: 50)

    @dishes = Dish.all
  end

  it "can see name of chef and a link to view all ingredients in their dishes" do
    visit chef_path(@dani)

    expect(page).to have_content(@dani.name)
    expect(page).to have_link("View Ingredients")

    click_link "View Ingredients"

    expect(current_path).to eq(chef_ingredients_path(@dani))
    expect(page).to have_content(@lettuce.name)
    expect(page).to have_content(@hb.name)
  end
end
