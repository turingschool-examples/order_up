require 'rails_helper'

describe "As a visitor when I visit a dish's show page" do
  before :each do
    chef_ryan = Chef.create!(
      name: 'Ryan'
    )
    @dish = chef_ryan.dishes.create!(
      name: 'Test dish',
      description: 'Test description'
    )

    visit "/dishes/#{@dish.id}"
  end

  it "I see the dish’s name and description" do
    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
  end

  it "I see the chef's name" do
    expect(page).to have_content(@dish.chef.name)
  end
end
