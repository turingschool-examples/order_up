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
  describe 'When I visit a dishs show page' do
    it 'I see the dish name, ingredients, and chef' do
      visit dish_path(@dish1.id)

      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)

      @dish1.ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end

      expect(page).to have_content(@dish1.chef.name)
    end

    it 'I see the total calorie count for the dish' do
      visit dish_path(@dish1.id)

      expect(page).to have_content('18')
    end
  end
end
