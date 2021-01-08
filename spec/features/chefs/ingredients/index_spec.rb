require 'rails_helper'

RSpec.describe "chef show page" do
  before(:each) do
    @chef = Chef.create!(name: "Tim")
    @dif_chef = Chef.create!(name: "Not this chef")
    @mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')
    @dif_dish = @dif_chef.dishes.create!(name: 'Different dish', description: 'good')
    @tikka_masala = @chef.dishes.create!(name: 'tikka masala', description: 'classic indian')
    @sugar = @dif_dish.ingredients.create!(name: 'sugar', calories: 100)
    @cream = @tikka_masala.ingredients.create!(name: 'cream', calories: 1000)
    @masala = @tikka_masala.ingredients.create!(name: 'masala', calories: 400)
    @pasta = @mac.ingredients.create!(name: 'pasta', calories: 1000)
    @cheese = @mac.ingredients.create!(name: 'cheese', calories: 100)
    @mac.ingredients << @cream
  end

  it 'shows unique list of chefs ingredients' do
    visit chef_ingredients_path(@chef)

    @chef.ingredients_list.each do |ingredient|
      expect(page).to have_content(ingredient.name, count: 1)
    end
  end

end

# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
