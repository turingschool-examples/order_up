require 'rails_helper'

describe 'Dish Show Page' do
  before :each do
    @chef = Chef.create(name: "Gordan")
    @dish = @chef.dishes.create(name: "Pizza", description: "Tasty")
    @ingredient1 = @dish.ingredients.create(name: "Sauce", calories: 40)
    @ingredient2 = @dish.ingredients.create(name: "Crust", calories: 100)
    @ingredient3 = @dish.ingredients.create(name: "Cheese", calories: 90)
end
 it 'sees Dish attributes' do
   visit "/dishes/#{@dish.id}"

   expect(page).to have_content(@dish.name)
   expect(page).to have_content(@dish.description)
   expect(page).to have_content(@ingredient1.name)
   expect(page).to have_content(@ingredient2.name)
   expect(page).to have_content(@ingredient3.name)
   expect(page).to have_content(@dish.calorie_count)
   expect(page).to have_content(@chef.name)
 end

 it "can delete ingredients from dish" do
   visit "/dishes/#{@dish.id}"

   expect(page).to have_content(@ingredient1.name)
   expect(page).to have_content(@ingredient2.name)
   expect(page).to have_content(@ingredient3.name)

   # save_and_open_page
   click_button("Remove Ingredient", match: :first)
   expect(page).to_not have_content(@ingredient1.name)
 end
end
