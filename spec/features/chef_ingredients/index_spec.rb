require 'rails_helper'

RSpec.describe 'the ingredients index page for a chef' do
  describe 'when I visit a chef ingredients index page' do
    it 'shows all the ingredients used in all of their recipes' do
      @chef = Chef.create!(name: "Gordon Ramsey")

      @dish = Dish.create!(name: "Beef Wellington", description: "A delightful beef lightly coated", chef_id: @chef.id)
      @dish2 = Dish.create!(name: "Fetuccine", description: "light but creamy", chef_id: @chef.id)

      @beef = Ingredient.create!(name: 'beef tenderloin', calories: 125)
      @flour = Ingredient.create!(name: 'flour', calories: 15)
      @cream = Ingredient.create!(name: 'cream', calories: 45)
      @pasta = Ingredient.create!(name: 'pasta', calories: 200)

      DishIngredient.create!(dish: @dish, ingredient: @beef)
      DishIngredient.create!(dish: @dish, ingredient: @flour)
      DishIngredient.create!(dish: @dish2, ingredient: @cream)
      DishIngredient.create!(dish: @dish2, ingredient: @pasta)
      DishIngredient.create!(dish: @dish2, ingredient: @flour)

      visit "/chef/#{@chef.id}/ingredients"

      expect(page).to have_content(@beef.name)
      expect(page).to have_content(@flour.name)
      expect(page).to have_content(@cream.name)
      expect(page).to have_content(@pasta.name)
    end
  end
end
