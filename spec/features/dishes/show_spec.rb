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
    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
  end

  it "I see the chef's name" do
    expect(page).to have_content(@dish.chef.name)
  end

  it 'I see a list of ingredients for that dish' do
    @dish.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
  end
end
