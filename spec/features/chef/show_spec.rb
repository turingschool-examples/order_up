require 'rails_helper'

RSpec.describe "chef" do
  describe "show page" do
    it 'displays the name and list of ingredients' do
      chef = Chef.create!(name: "Daniel")
      dish = Dish.create!(name: "fruit bowl", description: "A bowl of fruit", chef_id: "#{chef.id}")
      dish2 = Dish.create!(name: "Orangaid", description: "pureed oranges", chef_id: "#{chef.id}")
      ingredient = Ingredient.create!(name: "Apple", calories: 50)
      ingredient2 = Ingredient.create!(name: "Orange", calories: 70)
      DishIngredient.create!(dish_id: "#{dish.id}", ingredient_id: "#{ingredient.id}")
      DishIngredient.create!(dish_id: "#{dish.id}", ingredient_id: "#{ingredient2.id}")
      DishIngredient.create!(dish_id: "#{dish2.id}", ingredient_id: "#{ingredient2.id}")

      visit "/chef/#{chef.id}"
      expect(page).to have_content(chef.name)
      expect(page).to have_link("View chef's ingredients")

      click_link "View chef's ingredients"

      expect(current_path).to eq("/chef/#{chef.id}/ingredients")

      expect(page).to have_content(ingredient.name)
      expect(page).to have_content(ingredient2.name)
    end
  end
end
