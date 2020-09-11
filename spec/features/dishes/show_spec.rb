require 'rails_helper'
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name
RSpec.describe 'As a visitor' do
  describe "when I visit a dish's show page" do
    it "I see the dish's name and description" do
      @chef = Chef.create!(name: 'Phil')
      @dish = @chef.dishes.create!(name: 'Grilled Cheese', description: 'Gooey cheese bread')

      visit "dishes/#{@dish.id}"

      expect(page).to have_content("#{@dish.name}")
      expect(page).to have_content("#{@dish.description}")
    end

  end
end
