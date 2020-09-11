require 'rails_helper'

describe "As a visitor when I visit a chef's show page" do
  before :each do
    chef_ryan = Chef.create!(
      name: 'Ryan'
    )
    @dish = chef_ryan.dishes.create!(
      name: 'Test dish',
      description: 'Test description'
    )
    @dish.ingredients.create!(
      name: 'Pizza',
      calories: 500
    )
    @dish.ingredients.create!(
      name: 'Salad',
      calories: 200
    )

    visit "/chefs/#{chef_ryan.id}"
  end

  it 'I see the name of that chef' do
    expect(page).to have_content('Ryan')
  end
end
