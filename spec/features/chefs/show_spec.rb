require 'rails_helper'

RSpec.describe 'Show Page' do
  before :each do
    @chef = Chef.create!(name: 'Gordon Lambsauce')
    @dish_1 = @chef.dishes.create!(name: 'Idiot Sandwich', description: 'Tasty meal consisting of two breads and an idiot')
    @ingredient_1 = Ingredient.create!(name: 'Bread Loaf', calories: 100)
    @ingredient_2 = Ingredient.create!(name: 'Idiot', calories: 150)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)

    visit "/chefs/#{@chef.id}"
  end
  describe 'Attributes' do
    it 'can display the chefs attributes and all ingredients they use' do
      expect(page).to have_content(@chef.name)

      within('section.list-ingredients') do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
      end
    end
    it 'can click on ingredients and be redirected to the chef ingredient index page' do
      click_on "List of Ingredients #{@chef.name} Uses"

      expect(current_path).to eq("chefs/#{@chef.id}/ingredients")
    end
  end
end