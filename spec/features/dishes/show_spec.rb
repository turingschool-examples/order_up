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
    @dish.ingredients.create!(
      name: 'Pizza',
      calories: 500
    )
    @dish.ingredients.create!(
      name: 'Salad',
      calories: 200
    )

    visit "/dishes/#{@dish.id}"
  end

  it "I see the dish’s name and description" do
    expect(page).to have_content('Test dish')
    expect(page).to have_content('Test description')
  end

  it "I see the chef's name" do
    expect(page).to have_content('Ryan')
  end

  it 'I see a list of ingredients for that dish' do
    @dish.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
  end

  it 'I see the total calorie count for that dish' do
    expect(page).to have_content('Total Calories: 700')
  end
end
