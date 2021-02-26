require 'rails_helper'

RSpec.describe 'Chef ingredients index page' do
  before :each do
    @guy = Chef.create!(name: 'Guy Fieri')
    create_ingredients
    create_burger_for_guy
    create_nachos_for_guy
  end

  describe 'as a visitor' do
    it 'shows distinct list of ingredients from all dishes' do
      visit chef_ingredients_path(@guy)

      within('#all-ingredients') do
        expect(page).to have_content('Bun', count: 1)
        expect(page).to have_content('Meat', count: 1)
        expect(page).to have_content('Chips', count: 1)
        expect(page).to have_content('Cheese', count: 1)
        expect(page).to have_content('Jalepeno', count: 1)
      end
    end
  end

  def create_ingredients
    @bun = Ingredient.create!(name: 'Bun', calories: 10)
    @meat = Ingredient.create!(name: 'Meat', calories: 50)
    @chip = Ingredient.create!(name: 'Chips', calories: 10)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 60)
    @jalepeno = Ingredient.create!(name: 'Jalepeno', calories: 5)
  end

  def create_burger_for_guy
    @burger = @guy.dishes.create!(name: 'Burger', description: 'A classic.')
    @burger.ingredients << @bun
    @burger.ingredients << @meat
    @burger.ingredients << @jalepeno
  end

  def create_nachos_for_guy
    @nachos = @guy.dishes.create!(name: 'Nachos', description: "You can't go wrong with this.")
    @nachos.ingredients << @chip
    @nachos.ingredients << @cheese
    @nachos.ingredients << @jalepeno
  end
end
