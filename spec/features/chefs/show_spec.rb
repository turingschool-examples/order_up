require 'rails_helper'

RSpec.describe 'Chef show page' do
  before :each do
    @guy = Chef.create!(name: 'Guy Fieri')
    create_burger_for_guy
    create_nachos_for_guy
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

  def create_burger_for_guy
    @burger = @guy.dishes.create!(name: 'Burger', description: 'A classic.')
    @burger.ingredients.create!(name: 'Bun', calories: 10)
    @burger.ingredients.create!(name: 'Meat', calories: 50)
  end

  def create_nachos_for_guy
    @nachos = @guy.dishes.create!(name: 'Nachos', description: "You can't go wrong with this.")
    @nachos.ingredients.create!(name: 'Chip-os', calories: 10)
    @nachos.ingredients.create!(name: 'Cheese-os', calories: 60)
    @nachos.ingredients.create!(name: 'Jalepenos', calories: 5)
  end
end
