require 'rails_helper'

RSpec.describe 'Chef show page', type: :feature do 
  before :each do 
    @chef_1 = Chef.create!(name: "Dave Chang")

    @dish_1 = @chef_1.dishes.create!(name: "Chawan Mushi", description: "steamed Japanese egg custard with mushrooms and crabmeat")

    @ingredient_1 = @dish_1.ingredients.create!(name: "Mushrooms", calories: "65")
    @ingredient_2 = @dish_1.ingredients.create!(name: "Crabmeat", calories: "82")
  end

  it "can link to list of ingredients this chef uses" do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content("#{@chef_1.name}")
    expect(page).to have_link("See all ingredients that #{@chef_1.name} uses")

    click_link "See all ingredients that #{@chef_1.name} uses"

    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
    expect(page). to have_content("#{@chef_1.ingredients_used.join(", ")}")
  end
end