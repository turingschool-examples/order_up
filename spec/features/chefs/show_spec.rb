require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a chefs show page' do
    it "I see the name of that chef and a link to a list of ingredients the chef uses" do
      gordon = Chef.create({name: "Gordon Ramsey"})

      visit "/chefs/#{gordon.id}"

      expect(page).to have_content(gordon.name)
      expect(page).to have_link("All Ingredients")
    end
  end
end
