require 'rails_helper'

RSpec.describe 'Dish show page', type: :feature do 
  before :each do 
    @chef_1 = Chef.create!(name: "Dave Chang")

    @dish_1 = @chef_1.dishes.create!(name: "Chawan Mushi", description: "steamed Japanese egg custard with mushrooms and crabmeat")

    @ingredient_1 = @dish_1.ingredients.create!(name: "Mushrooms", calories: "65")
    @ingredient_2 = @dish_1.ingredients.create!(name: "Crabmeat", calories: "82")
  end

  it "can see dish's information" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("#{@dish_1.name}")
    expect(page).to have_content("Description: #{@dish_1.description}")
    expect(page).to have_content("#{@dish_1.ingredient_list.join(", ")}")
    expect(page).to have_content("Chef: #{@chef_1.name}")
  end

end