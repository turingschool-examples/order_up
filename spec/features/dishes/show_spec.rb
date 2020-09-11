# As a visitor
# - When I visit a dish's show page
# - I see the dish’s name and description
# - And I see a list of ingredients for that dish
# - And I see the chef's name

require 'rails_helper'

RSpec.describe "Dish's Show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Emeril Lagasse")
    @dish_1 = @chef_1.dishes.create!(name: "Jalapeno Cornbread", description: "The cornbread has the perfect texture and the jalapenos add a great kick.")
    @corn = @dish_1.ingredients.create!(name: "corn", calories: 132)
    @milk = @dish_1.ingredients.create!(name: "milk", calories: 122)
    @jalapeno = @dish_1.ingredients.create!(name: "jalapeno", calories: 4)
    @flour = @dish_1.ingredients.create!(name: "flour", calories: 100)
  end

  it "will see list of ingredients for dish and chef's name" do

    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content(@chef_1.name)

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)

    expect(page).to have_content(@corn.name)
    expect(page).to have_content(@milk.name)
    expect(page).to have_content(@jalapeno.name)
    expect(page).to have_content(@flour.name)
  end

end
