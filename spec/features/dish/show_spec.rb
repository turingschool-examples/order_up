require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  describe 'As a visitor' do
    before :each do
      @dish1 = Dish.create(name: "Cheese Burger", description: 'Cheesy goodness')
    end
      it "visits dish show page and dishes name and description are present" do
      visit "/dish"
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
    end
  end
end
