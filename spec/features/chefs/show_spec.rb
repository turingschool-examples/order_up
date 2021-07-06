require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'when I visit the show page' do
    before :each do
      @chef = Chef.create!(name: "Gordon Ramsey")
      @dish = Dish.create!(name: "Beef Wellington", description: "A delightful beef lightly coated", chef_id: @chef.id)


      @beef = Ingredient.create!(name: 'beef tenderloin', calories: 125)
      @flour = Ingredient.create!(name: 'flour', calories: 15)

      DishIngredient.create!(dish: @dish, ingredient: @beef)
      DishIngredient.create!(dish: @dish, ingredient: @flour)
    end

    it 'shows the name of the chef' do

      visit "/chef/#{@chef.id}"

      expect(page).to have_content("Gordon Ramsey")
    end

    it 'shows a link to view a list of all the ingredients the chef uses in dishes' do
      visit "/chef/#{@chef.id}"
      expect(page).to have_link("Chef's Cupboard")
    end

    it 'will take me to the ingredient index page for that chef' do
      visit "/chef/#{@chef.id}"
      click_link("Chef's Cupboard")

      expect(current_path).to eq("/chef/#{@chef.id}/ingredients")
    end
  end
end
