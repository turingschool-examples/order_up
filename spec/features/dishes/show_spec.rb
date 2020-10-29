#Story 1 of 3
require 'rails_helper'
describe 'As a visitor' do
  before(:each) do
    @chef = Chef.create!(name: "boyardee")
    @dish = Dish.create!(name: 'cornbread',
                        description: 'bread',
                        chef_id: @chef.id)
    @ingredient1 = Ingredient.create!(name: 'corn')
    @ingredient2 = Ingredient.create!(name: 'butter')
    DishesIngredient.create!(dish: @dish, ingredient: @ingredient1)
    DishesIngredient.create!(dish: @dish, ingredient: @ingredient2)
  end
  describe "When I visit a dish's show page" do
    it "I see the dish’s name and description" do
      visit "/dishes/#{@dish.id}"
      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end
    it "And I see a list of ingredients for that dish" do
      visit "/dishes/#{@dish.id}"
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
    end
    it "And I see the chef's name" do
      visit "/dishes/#{@dish.id}"
      expect(page).to have_content(@chef.name)
    end
  end
end
