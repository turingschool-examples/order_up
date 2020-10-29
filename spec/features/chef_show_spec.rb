require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @chef1 = Chef.create!(name: 'gerald')

    @dish1 = Dish.create!(name: 'cheese',
                          description: 'its cheese',
                          chef_id: @chef1.id)

    @ingredient1 = Ingredient.create!(name: 'milk',
                                      calories: 4)

    @ingredient2 = Ingredient.create!(name: 'other cheese stuff',
                                      calories: 6)

    @ingredient3 = Ingredient.create!(name: 'more cheese stuff',
                                      calories: 8)

    @dish1.ingredients << @ingredient1
    @dish1.ingredients << @ingredient2
    @dish1.ingredients << @ingredient3
  end
  describe 'When I visit a chefs show page' do
    it 'I see the name of the chef and a link to the ingredients they use' do
      visit chef_path(@chef1.id)

      expect(page).to have_content(@chef1.name)
      expect(page).to  have_link('Ingredients used')
    end

    it 'When I click the ingredients link it takes me to the ingredient index page for that chef' do
      visit chef_path(@chef1.id)

      click_link('Ingredients used')

      expect(page).to have_current_path(chef_ingredients_path(@chef1.id))

      expect(page).to have_content('milk')
      expect(page).to have_content('other cheese stuff')
      expect(page).to have_content('more cheese stuff')
    end
  end
end
