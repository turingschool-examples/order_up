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
  end
  xit 'displays a list of the ingredients' do

  end
  xit 'displays the chefs name' do

  end
  xit 'displays the total calorie count for the dish' do

  end
end
