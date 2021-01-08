require 'rails_helper'

RSpec.describe 'Index Page' do
  before :each do
    @chef = Chef.create!(name: 'Gordon Lambsauce')
    @dish_1 = @chef.dishes.create!(name: 'Idiot Sandwich', description: 'Tasty meal consisting of two breads and an idiot')
    @dish_2 = @chef.dishes.create!(name: 'Wet Sammich', description: 'Idiot Sandwich with Lambsauce')
    @ingredient_1 = Ingredient.create!(name: 'Bread Loaf', calories: 100)
    @ingredient_2 = Ingredient.create!(name: 'Idiot', calories: 150)
    @ingredient_3 = Ingredient.create!(name: 'Lamb Sauce', calories: 200)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)

    visit "/chefs/#{@chef.id}/ingredients"
  end
  describe 'Attributes' do
    it 'can display the chefs unique list of ingredients they use' do
      expect(page).to have_content(@chef.name)

      within('section.list-ingredients') do
        within all('.ingredient')[0] do
          expect(page).to have_content("#{@ingredient_1.name} - #{@ingredient_1.calories} calories")
        end
        within all('.ingredient')[1] do
          expect(page).to have_content("#{@ingredient_2.name} - #{@ingredient_2.calories} calories")
        end
        within all('.ingredient')[2] do
          expect(page).to have_content("#{@ingredient_3.name} - #{@ingredient_3.calories} calories")
        end
      end
    end
  end
end