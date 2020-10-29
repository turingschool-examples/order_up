require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I visit a chef's show page" do
    before(:each) do
      @chef = Chef.create!(
        name: "SpongeBob"
      )

      @burger = Dish.create!(
        name: "Krabby Patty",
        description: "Delicious undersea burger",
        chef_id: @chef.id
      )

      @fries = Dish.create!(
        name: "Kelp Fries",
        description: "Perfect side to a Krabby Patty",
        chef_id: @chef.id
      )

      @patty = Ingredient.create!(
        name: "Burger Patty",
        calories: 300
      )

      @lettuce = Ingredient.create!(
        name: "Lettuce",
        calories: 10
      )

      @bun = Ingredient.create!(
        name: "Burger Bun",
        calories: 30
      )

      @kelp = Ingredient.create!(
        name: "Kelp",
        calories: 10
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @patty.id 
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @lettuce.id 
      )

      Recipe.create!(
        dish_id: @burger.id,
        ingredient_id: @bun.id 
      )

      Recipe.create!(
        dish_id: @fries.id,
        ingredient_id: @kelp.id 
      )
    end 
    it "I see that chef's name, a link to thier dishes' ingredients 
        with a link to the chef's ingredient index page" do
        visit "/chefs/#{@chef.id}"
        
        expect(page).to have_content("SpongeBob")
        expect(page).to have_link("View Chef's Ingredients")

        click_link("View Chef's Ingredients")
        expect(current_path).to eq("/chefs/#{@chef.id}/index")

        expect(page).to have_content("Ingredients Used By Chef #{@chef.name}:")
        expect(page).to have_content("#{@patty.name}")
        expect(page).to have_content("#{@lettuce.name}")
        expect(page).to have_content("#{@bun.name}")
        expect(page).to have_content("#{@kelp.name}")
    end
  end 
end 