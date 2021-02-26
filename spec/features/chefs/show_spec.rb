require "rails_helper"

RSpec.describe 'the Chef show page' do
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
  it 'displays chef name and ingredients link' do
    visit "/chefs/#{@gus.id}"

    expect(page).to have_content('Chef Gusteau')
    expect(page).to have_link('All Gusteau Ingredients')
  end
  it "redirects to chef ingredient show page on link click" do
    visit "/chefs/#{@gus.id}"

    click_link 'All Gusteau Ingredients'

    expect(current_path).to eq("/chefs/#{@gus.id}/ingredients")
  end
end
