require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do
    @chef = Chef.create(name: "Swedish Chef")
    @dish = @chef.dishes.create(name: "Orgabork", description: "Bork Bork Bork")
    @ingredient1 = @dish.ingredients.create(name: "Chicken", calories: 50)
    @ingredient2 = @dish.ingredients.create(name: "Fish", calories: 50)
    @ingredient3 = @dish.ingredients.create(name: "Onion", calories: 50)
    @ingredient4 = @dish.ingredients.create(name: "Carrot", calories: 50)
    @dish2 = @chef.dishes.create(name: "Orgabork", description: "Bork Bork Bork")
    @dish2.ingredients << @ingredient1
    @dish2.ingredients << @ingredient2
    @dish2.ingredients << @ingredient3

    @dish3 = @chef.dishes.create(name: "Orgabork", description: "Bork Bork Bork")
    @dish3.ingredients << @ingredient1
    @dish3.ingredients << @ingredient2


  end

  it "displays the chef's name" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
  end

  it "displays link to chef's ingredient index" do
    visit "/chefs/#{@chef.id}"

    click_on "Ingredient Index"
    expect(current_path).to eq ("/chefs/#{@chef.id}/ingredients")
  end

  it "displays the chef's three most popular ingredients" do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to_not have_content(@ingredient4.name)
  end
end
