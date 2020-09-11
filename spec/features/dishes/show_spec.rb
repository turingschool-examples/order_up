require 'rails_helper'

RSpec.describe "dish" do
  describe "show page" do
    it 'displays the dish name, description, ingreients, and chef' do
      chef = Chef.create!(name: "Daniel")
      dish = Dish.create!(name: "fruit bowl", description: "A bowl of fruit", chef_id: "#{chef.id}")
      ingredient = Ingredient.create!(name: "Apple", dish_id: "#{dish.id}")

      visit "/dish/#{dish.id}"
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
      expect(page).to have_content(ingredient.name)
      expect(page).to have_content(chef.name)
    end
  end
end
