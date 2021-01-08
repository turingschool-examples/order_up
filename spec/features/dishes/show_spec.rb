require 'rails_helper'

RSpec.describe 'Show Page' do
  before :each do
    @chef = Chef.create!(name: 'Gordon Lambsauce')
    @dish_1 = @chef.dishes.create!(name: 'Idiot Sandwich', description: 'Tasty meal consisting of two breads and an idiot')
    @ingredient_1 = Ingredient.create!(name: 'Bread Loaf', calories: 100)
    @ingredient_2 = Ingredient.create!(name: 'Idiot', calories: 150)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)

    visit "/dishes/#{@dish_1.id}"
  end
  describe 'Attributes' do
    it 'can display a dish and its attributes along with list of ingredients and chef name' do
      expect(page).to have_content(@dish_1.name)
      within('section.dish-breakdown') do
        expect(page).to have_content(@dish_1.description)
      end
      within('section.list-ingredients') do
        within all('.ingredient')[0] do
          expect(page).to have_content("#{@ingredient_1.name} - #{@ingredient_1.calories} calories")
        end
        within all('.ingredient')[1] do
          expect(page).to have_content("#{@ingredient_2.name} - #{@ingredient_2.calories} calories")
        end
      end
      within('section.chef-name') do
        expect(page).to have_content("Created by Chef #{@chef.name}")
      end
    end
  end
end