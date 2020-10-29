require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dish's show page" do
    before(:each) do
      @chef = Chef.create!({
        name: 'Matty Meatballs'
        })

      @dish = Dish.create!({
        name: 'Meatballs',
        description: 'Hearty, comes with four.',
        chef_id: "#{@chef.id}"
        })

      @ingredient_1 = Ingredient.create!({
        name: 'Meatball',
        calories: 90
        })

      @ingredient_2 = Ingredient.create!({
        name: 'Marinara sauce',
        calories: 30
        })

      @d_i_meat = DishIngredient.create!({
        dish_id: @dish.id,
        ingredient_id: @ingredient_1.id
        })

      @d_i_sauce = DishIngredient.create!({
        dish_id: @dish.id,
        ingredient_id: @ingredient_2.id
        })

    end
    it "I see the dish's name and description, list of ingredients, and chef's name" do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("#{@dish.name}")
      expect(page).to have_content("#{@dish.description}")
      expect(page).to have_content("#{@ingredient_1.name}")
      expect(page).to have_content("#{@ingredient_2.name}")
      expect(page).to have_content("Created by #{@chef.name}")
    end
  end
end