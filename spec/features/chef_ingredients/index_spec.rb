require 'rails_helper'

describe "As a visitor when I visit a chef's ingredients index page" do
  before :each do
    chef_ryan = Chef.create!(
      name: 'Ryan'
    )
    other_chef = Chef.create!(
      name: 'Evil Competitor'
    )
    bad_dish = other_chef.dishes.create!(
      name: 'Bad dish',
      description: 'Poor quality'
    )
    bad_dish.ingredients.create!(
      name: 'Fish',
      calories: 250
    )
    bad_dish.ingredients.create!(
      name: 'Octopus',
      calories: 400
    )
    dish = chef_ryan.dishes.create!(
      name: 'Test dish',
      description: 'Test description'
    )
    dish.ingredients.create!(
      name: 'Pizza',
      calories: 500
    )
    dish.ingredients.create!(
      name: 'Salad',
      calories: 200
    )

    visit "/chefs/#{chef_ryan.id}/ingredients"
  end

  it 'I see a a list of all ingredients that chef uses' do
    expect(page).to have_content("Pizza")
    expect(page).to have_content("Salad")
    expect(page).to_not have_content("Fish")
    expect(page).to_not have_content("Octopus")
  end
end
