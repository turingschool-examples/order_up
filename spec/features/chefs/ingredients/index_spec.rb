require 'rails_helper'

describe "As a visitor" do
  describe "When I am taken to a chef's ingredient index page" do
    before(:each)do
      @chef = Chef.create!({
        name: 'Matty Meatballs'
        })

      @dish_1 = Dish.create!({
        name: 'Meatballs',
        description: 'Hearty, comes with four.',
        chef_id: "#{@chef.id}"
        })

      @dish_2 = Dish.create!({
        name: 'Hamburger',
        description: 'Big, delicious, filling.',
        chef_id: "#{@chef.id}"
        })

      @ingredient_1 = Ingredient.create!({
        name: 'Meatballs',
        calories: 360
        })

      @ingredient_2 = Ingredient.create!({
        name: 'Marinara sauce',
        calories: 30
        })

      @ingredient_3 = Ingredient.create!({
        name: 'Burger patty',
        calories: 120
        })

      @ingredient_4 = Ingredient.create!({
        name: 'Bun',
        calories: 70
        })

      @ingredient_5 = Ingredient.create!({
        name: 'Cheese',
        calories: 60
        })

      @d_i_meatball = DishIngredient.create!({
        dish_id: @dish_1.id,
        ingredient_id: @ingredient_1.id
        })

      @d_i_marinara = DishIngredient.create!({
        dish_id: @dish_1.id,
        ingredient_id: @ingredient_2.id
        })

      @d_i_patty = DishIngredient.create!({
        dish_id: @dish_2.id,
        ingredient_id: @ingredient_3.id
        })

      @d_i_bun = DishIngredient.create!({
        dish_id: @dish_2.id,
        ingredient_id: @ingredient_4.id
        })

      @d_i_cheese = DishIngredient.create!({
        dish_id: @dish_2.id,
        ingredient_id: @ingredient_5.id
        })
    end

    it "I see a unique list of all the ingredients this chef uses" do
      visit "/chefs/#{@chef.id}/ingredients"

      expect(page).to have_content("#{@chef.name} Ingredients")
      expect(page).to have_content("#{@ingredient_1.name}")
      expect(page).to have_content("#{@ingredient_2.name}")
      expect(page).to have_content("#{@ingredient_3.name}")
      expect(page).to have_content("#{@ingredient_4.name}")
      expect(page).to have_content("#{@ingredient_5.name}")
    end
  end
end