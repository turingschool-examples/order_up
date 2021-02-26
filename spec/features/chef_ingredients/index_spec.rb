require "rails_helper"

RSpec.describe 'the Chef ingredient index page' do
  before :each do
    @gus = Chef.create!( name: 'Gusteau' )
    @dish1 = @gus.dishes.create!( name: 'Clam Spaghetti', description: 'spicy seafood pasta' )
    @dish2 = @gus.dishes.create!( name: 'Bingo Soup', description: 'creative and colorful' )

    @clam = @dish1.ingredients.create!( name: 'clams', calories: 200 )
    @spag = @dish1.ingredients.create!( name: 'thin spaghetti', calories: 400 )

    @fish = @dish2.ingredients.create!( name: 'smoked fish', calories: 150)
    @rice = @dish2.ingredients.create!( name: 'omni-rice', calories: 5511)
    @clam2 = @dish2.ingredients.create!( name: 'clams', calories: 200 )
  end
  it "shows unique list of used ingredient names" do
    visit "/chefs/#{@gus.id}/ingredients"

    expect(page).to have_content('clams')
    expect(page).to have_content('thin spaghetti')
    expect(page).to have_content('smoked fish')
    expect(page).to have_content('omni-rice')
  end
end
