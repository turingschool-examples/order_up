require 'rails_helper'

RSpec.describe 'Chef show page', type: :feature do
  before :each do
    @chef = Chef.create!(name: "Billy bob")
    @dish_1 = @chef.dishes.create!(name: "Salad", description: "Super healthy")
    @ingredient_1 = @dish_1.ingredients.create!(name: "Spinach", calories: 25)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Feta cheese", calories: 50)
    @ingredient_3 = @dish_1.ingredients.create!(name: "Tomatoes", calories: 15)
  end

  it 'Displays chefs name and a link to their ingredients' do
    visit "/chefs/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    expect(page).to have_link("Ingredents they use")
  end

end
