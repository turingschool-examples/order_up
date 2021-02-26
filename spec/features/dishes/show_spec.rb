require 'rails_helper'

RSpec.describe 'Dish show page' do
  before :each do
    @chef = Chef.create(name: "Swedish Chef")
    @dish = @chef.dishes.create(name: "Orgabork", description: "Bork Bork Bork")
    @ingredient1 = @dish.ingredients.create(name: "Chicken", calories: 50)
    @ingredient2 = @dish.ingredients.create(name: "Fish", calories: 50)
  end
  it "displays the dish's name and description" do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
  end

  it "displays a list of ingredients in the dish" do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
  end

  it "displays the chef's name" do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@chef.name)
  end

  it "displays total calories" do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.total_callories)
  end

  it "displays option to remove each ingredient" do
    visit "/dishes/#{@dish.id}"
    within("#ingredient-#{@ingredient1.id}") do
      expect(page).to have_button "Remove"
    end
    within("#ingredient-#{@ingredient2.id}") do
      expect(page).to have_button "Remove"
    end
  end

  it "removes ingredient from list when remove is clicked" do
    visit "/dishes/#{@dish.id}"
    within("#ingredient-#{@ingredient1.id}") do
      click_on "Remove"
    end
    expect(page).to have_content(@ingredient2.name)
    expect(page).to_not have_content(@ingredient1.name)
  end

end


# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
# Abd I see the total calorie count for that dish.
