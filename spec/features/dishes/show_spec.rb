require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit the dish show page' do
    it "I see the dish details, including chef name and ingredients" do
      susan = Chef.create(name: 'Susan Daly')
      pad_thai = Dish.create(
        name: 'Pad Thai',
        description: 'A stir-fried rice noodle dish.',
        chef_id: susan.id
      )
      eggs = Ingredient.create(name: 'Scrambled egg', calories: 100)
      noodles = Ingredient.create(name: 'Rice noodles', calories: 200)
      DishIngredient.create(dish: pad_thai, ingredient: eggs)
      DishIngredient.create(dish: pad_thai, ingredient: noodles)

      visit dish_path(pad_thai)

      within('.dish-info') do
        expect(page).to have_content(pad_thai.name)
        expect(page).to have_content(pad_thai.description)
        expect(page).to have_content(susan.name)
      end

      within('.ingredients') do
        expect(page).to have_content(eggs.name)
        expect(page).to have_content(noodles.name)
      end
    end
  end
end
