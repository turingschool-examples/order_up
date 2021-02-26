require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @chef = Chef.create!(name: "Bob")
    @dish_1 = Dish.create!(name: "Pasta", description: 'Good dish', chef_id: @chef.id)
    @dish_2 = Dish.create!(name: "Soup", description: 'Good soup', chef_id: @chef.id)

    @ingredient_1 = @dish_1.ingredients.create!(name: 'onions', calories: 100)
    @ingredient_2 = @dish_1.ingredients.create!(name: 'noodles', calories: 350)
    @ingredient_3 = @dish_1.ingredients.create!(name: 'sauce', calories: 200)

    @ingredient_4 = @dish_2.ingredients << @ingredient_1
    @ingredient_5 = @dish_2.ingredients.create!(name: 'chicken stock', calories: 100)
    @ingredient_6 = @dish_2.ingredients.create!(name: 'bell peppers', calories: 25)
  end

  describe "When I visit a chef's show page" do
    it 'I see the name of that chef' do
      visit chef_path(@chef)

      within("#chef-#{@chef.id}") do
        expect(page).to have_content(@chef.name)
      end
    end

    it 'I see a link to view a list of all ingredients that this chef uses in their dishes' do
      visit chef_path(@chef)

      within("#chef-#{@chef.id}") do
        expect(page).to have_link('View All Ingredients')
      end
    end

    it "I click on an ingredient and am taken to a chef's ingredients index page" do
      visit chef_path(@chef)

      within("#chef-#{@chef.id}") do
        click_link('View All Ingredients')
      end

      expect(current_path).to eq(chef_ingredients_path(@chef))
    end

    it 'I can see a unique list of names of all the ingredients that this chef uses' do
      visit chef_ingredients_path(@chef)

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to have_content(@ingredient_5.name)
      expect(page).to have_content(@ingredient_6.name)
    end

    it 'I see the three most popular ingredients that the chef uses in their dishes' do
      visit chef_ingredients_path(@chef)

      expect(page).to have_content(@ingredient_1.name)
    end
  end
end
