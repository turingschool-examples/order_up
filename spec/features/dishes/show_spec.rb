require 'rails_helper'

RSpec.describe 'dish show page' do
  before :each do
    @chef = Chef.create!(name: "Gordon Ramsey")
    @dish = Dish.create!(name: "Beef Wellington", description: "A delightful beef lightly coated", chef_id: @chef.id)
  end

  it 'allows me to visit the dish show page' do
    visit "/dish/#{@dish.id}"

    expect(current_path).to eq("/dish/#{@dish.id}")
  end

  it 'shows the dish attributes' do
    visit "/dish/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to have_content(@dish.chef.name)
  end

  it 'shows a list of ingredients for that dish' do
    visit "/dish/#{@dish.id}"

    expect(page).to have_content(@dish.ingredients)
  end
end
