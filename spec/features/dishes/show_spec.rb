require 'rails_helper'

describe 'Dish Show Page' do
  before :each do
    @chef = Chef.new(name: "Gordan")
    @dish = Dish.new(name: "Pizza", description: "Tasty", chef_id = @chef.id)
    @ingredient1 = Ingredient.new(name: "Sauce", calories: 40, dish_id = @dish.id)
    @ingredient2 = Ingredient.new(name: "Crust", calories: 100, dish_id = @dish.id)
    @ingredient3 = Ingredient.new(name: "Cheese", calories: 90, dish_id = @dish.id)
end
 it "sees Dish's attributes" do
   visit "/chefs/#{@chef.id}/dishes/#{@dish.id}"

   expect(page).to have_content(@dish.name)
   expect(page).to have_content(@dish.description)
   expect(page).to have_content(@ingredient1.name)
   expect(page).to have_content(@ingredient2.name)
   expect(page).to have_content(@ingredient3.name)
   expect(page).to have_content(@chef.name)
   expect(page).to have_content(@dish.calorie_count)
 end
