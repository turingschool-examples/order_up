require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    before(:each) do
      @chef = Chef.create!({name: 'Matty Meatballs'})
    end

    it "I see the name of that chef and a link to view a list of all
        ingredients this chef uses in their dishes" do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("#{@chef.name}")
      expect(page).to have_link("This Chef's Favorite Ingredients")
    end

    it "When I click that link I am taken to the chef's ingredient index page" do
      visit "/chefs/#{@chef.id}"

      click_link "This Chef's Favorite Ingredients"
      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
    end

    it "I see the 3 most popular ingredients that chef uses" do
      dish_1 = Dish.create!({
        name: 'Meatballs',
        description: 'Hearty, comes with four.',
        chef_id: "#{@chef.id}"
        })

      dish_2 = Dish.create!({
        name: 'Meatball sub',
        description: 'Big, delicious, filling.',
        chef_id: "#{@chef.id}"
        })

      dish_3 = Dish.create!({
        name: 'Meatball Mac n Cheese',
        description: 'Gooey and warm.',
        chef_id: "#{@chef.id}"
        })

      dish_4 = Dish.create!({
        name: "Plain Mac",
        description: 'For the simpletons',
        chef_id: "#{@chef.id}"
        })

      ingredient_1 = Ingredient.create!({
        name: 'Meatballs',
        calories: 360
        })

      ingredient_2 = Ingredient.create!({
        name: 'Marinara sauce',
        calories: 30
        })

      ingredient_4 = Ingredient.create!({
        name: 'Bun',
        calories: 70
        })

      ingredient_5 = Ingredient.create!({
        name: 'Cheese',
        calories: 60
        })

      ingredient_6 = Ingredient.create!({
        name: 'Mac',
        calories: 60
        })

      d_i_meatball_1 = DishIngredient.create!({
        dish_id: dish_1.id,
        ingredient_id: ingredient_1.id
        })

      d_i_meatball_2 = DishIngredient.create!({
        dish_id: dish_2.id,
        ingredient_id: ingredient_1.id
        })

      d_i_meatball_2 = DishIngredient.create!({
        dish_id: dish_3.id,
        ingredient_id: ingredient_1.id
        })

      d_i_marinara = DishIngredient.create!({
        dish_id: dish_1.id,
        ingredient_id: ingredient_2.id
        })


      d_i_bun = DishIngredient.create!({
        dish_id: dish_2.id,
        ingredient_id: ingredient_4.id
        })

      d_i_cheese_1 = DishIngredient.create!({
        dish_id: dish_2.id,
        ingredient_id: ingredient_5.id
        })

      d_i_cheese_2 = DishIngredient.create!({
        dish_id: dish_3.id,
        ingredient_id: ingredient_5.id
        })

      d_i_mac = DishIngredient.create!({
        dish_id: dish_3.id,
        ingredient_id: ingredient_6.id
        })

      d_i_mac_2 = DishIngredient.create!({
        dish_id: dish_4.id,
        ingredient_id: ingredient_6.id
        })

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content("Top Ingredients")
      expect(page).to have_content("Meatballs")
      expect(page).to have_content("Cheese")
      expect(page).to have_content("Mac")
    end
  end
end