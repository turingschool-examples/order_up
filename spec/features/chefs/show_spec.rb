require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a chef's show page" do
    before :each do
      @chef_ryan = Chef.create!(name: 'Ryan')

      visit "/chefs/#{@chef_ryan.id}"
    end

    it 'I see the name of that chef' do
      expect(page).to have_content("Chef Name: #{@chef_ryan.name}")
    end

    it 'I see a link to view a list of all ingredients that this chef uses in their dishes' do
      expect(page).to have_link('Chef Ingredients')
    end

    describe 'When I click on that link' do
      it "I'm taken to a chef's ingredient index page" do
        click_link 'Chef Ingredients'

        expect(current_path).to eq("/chefs/#{@chef_ryan.id}/ingredients")
      end
    end
  end
end
