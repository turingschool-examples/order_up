require 'rails_helper'

RSpec.describe "dish show page" do
  before(:each) do
    @chef = Chef.create!(name: "Tim")
    @mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')
    @pasta = @mac.ingredients.create!(name: 'pasta', calories: 1000)
    @cheese = @mac.ingredients.create!(name: 'cheese', calories: 100)
  end
  it "shows dish attributes" do
    visit dish_path(@mac)

    expect(page).to have_content(@mac.name)
    expect(page).to have_content(@mac.description)
  end
  it 'shows all ingredients' do
    visit dish_path(@mac)

    expect(page).to have_content(@pasta.name)
    expect(page).to have_content(@cheese.name)
  end
  it 'shows the chef name' do
    visit dish_path(@mac)

    expect(page).to have_content(@chef.name)
  end
  it 'shows the calorie count for the dish' do
    visit dish_path(@mac)

    expect(page).to have_content("Total calories: #{@mac.calorie_count}")
  end
end
