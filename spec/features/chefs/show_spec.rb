require 'rails_helper'

describe "As a visitor when I visit a chef's show page" do
  before :each do
    @chef_ryan = Chef.create!(
      name: 'Ryan'
    )
    @dish = @chef_ryan.dishes.create!(
      name: 'Test dish',
      description: 'Test description'
    )
    @dish_2 = @chef_ryan.dishes.create!(
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
    @dish.ingredients.create!(
      name: 'Kale',
      calories: 100
    )
    @dish.ingredients.create!(
      name: 'Ice Cream',
      calories: 400
    )
    @dish.ingredients.create!(
      name: 'Sugar',
      calories: 300
    )

    @dish_2.ingredients.create!(
      name: 'Pizza',
      calories: 500
    )
    @dish_2.ingredients.create!(
      name: 'Ice Cream',
      calories: 400
    )
    @dish_2.ingredients.create!(
      name: 'Sugar',
      calories: 300
    )

    visit "/chefs/#{@chef_ryan.id}"
  end

  it 'I see the name of that chef' do
    expect(page).to have_content('Ryan')
  end

  it 'I see a link to view a list of all ingredients' do
    expect(page).to have_link('Ingredients This Chef Uses')

    click_link 'Ingredients This Chef Uses'

    expect(current_path).to eq("/chefs/#{@chef_ryan.id}/ingredients")
  end

  it 'I see the three most popular ingredients that the chef uses in their dishes' do
    within('.popular-ingredients') do
      expect(page).to have_content('Pizza')
      expect(page).to have_content('Ice Cream')
      expect(page).to have_content('Sugar')
    end
  end
end
