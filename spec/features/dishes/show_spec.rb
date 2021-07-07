#As a visitor
#When I visit a dish's show page
#I see the dish’s name and description
#And I see a list of ingredients for that dish
#And I see the chef's name

require "rails_helper"
RSpec.describe " As a visitor" do
  before :each do

    @chef_1 = Chef.create(name: "Boyer Dee")
    @dish_1 = @chef_1.dishes.create(
      name: "Chicken Parm",
      description: "Staff's Favorite"
    )
  end
  it "I visit a dish's show page" do

    visit "/dishes"

    click_on "#{@dish_1.name}"
save_and_open_page
    expect(current_path).to eq("/dishes/#{@dish_1.id}")
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content
  end
end
