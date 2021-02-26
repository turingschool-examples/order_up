require "rails_helper"

RSpec.describe 'the dish show page' do
  before :each do
    @gus = Chef.create!( name: 'Gusteau' )
    @dish1 = @gus.dishes.create!( name: 'Clam Spaghetti', description: 'spicy seafood pasta' )
    @clam = @dish1.ingredients.create!( name: 'clams', calories: 200 )
    @spag = @dish1.ingredients.create!( name: 'thin spaghetti', calories: 400 )
  end
  it 'displays dish name and description' do
    visit "/dishes/#{@dish1.id}"

    expect(page).to have_content('Clam Spaghetti')
    expect(page).to have_content('spicy seafood pasta')
  end
  it 'displays a list of the ingredients with associated delete buttons' do
    visit "/dishes/#{@dish1.id}"

    within('.ingredients') do
      expect(page).to have_content('clams')
      expect(page).to have_content('thin spaghetti')
    end
  end
  it 'displays the chefs name' do
    visit "/dishes/#{@dish1.id}"
    within('.chef') do
      expect(page).to have_content('Chef Gusteau')
    end
  end
  it 'displays the total calorie count for the dish' do
    visit "/dishes/#{@dish1.id}"

    within('.nutrition') do
      expect(page).to have_content('Total Calories per Serving: 600')
    end
  end
end
