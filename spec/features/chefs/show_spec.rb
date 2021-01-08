require 'rails_helper'

describe 'Chefs Show Page' do
  before :each do 
    @c1 = Chef.create!(name: 'Isabelle')
    visit chef_path(@c1)
  end

  it 'should display the chefs name' do
    expect(page).to have_content(@c1.name)
  end

  it 'should have a link to all ingredients this chef uses' do
    expect(page).to have_link("See All Ingredients #{@c1.name} Uses")
    click_link "See All Ingredients #{@c1.name} Uses"
    expect(current_path).to eq(chef_ingredient_path(@c1))
  end
end