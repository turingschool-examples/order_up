# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

require 'rails_helper'

RSpec.describe 'When I visit a dishes show page' do
  before :each do
    dani = Chef.create(name: "Dani Coleman")

    salad = dani.dishes.create(name: "Salad", description: "Refreshing")
    skinny = dani.dishes.create(name: "Skinny", description: "Hearty")
    cw = dani.dishes.create(name: "Cauliflower Wings", description: "Delish")

    lettuce = salad.ingredients.create(name: "Lettuce", calories: 40)
    hb = skinny.ingredients.create(name: "Hashbrowns", calories: 100)
    cauli = cw.ingredients.create(name: "Cauliflower", calories: 50)

    @dishes = Dish.all
  end

  it "can see a list of ingredients for that dish and the chefs name" do
    @dishes.each do |dish|
      visit dish_path(dish)
      expect(page).to have_content(dish.chef.name)
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
      dish.ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end
    end
  end

  it "can see the total calorie count for that dish" do
    @dishes.each do |dish|
      visit dish_path(dish)
      expect(page).to have_content(dish.total_calories)
    end 
  end
end
