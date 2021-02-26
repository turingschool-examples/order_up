require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do
    @guy = Chef.create!(name: 'Guy Fieri')
  end

  describe 'as a visitor' do
    it 'shows name of the chef' do
      visit chef_path(@guy)

      within('#chef-info') do
        expect(page).to have_content('Guy')
      end
    end

    it 'shows link to ingredients used by chef' do
      visit chef_path(@guy)

      expect(page).to have_link('View Ingredients Used By Guy Fieri')
      click_link('View Ingredients Used By Guy Fieri')
      expect(current_path).to eq(chef_ingredients_path(@guy))
    end
  end
end
