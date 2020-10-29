require 'rails_helper'

RSpec.describe 'On the chef show page' do
  it "it has a link to the chef's ingredient index page" do 
    chef_1 = Chef.create!(name: 'Pierre')
    
    visit "chefs/#{chef_1.id}"

    expect(page).to have_link("Ingredients #{chef_1.name} Uses")
  end
end