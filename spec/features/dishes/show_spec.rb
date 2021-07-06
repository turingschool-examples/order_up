require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I visit a dishes show page' do
    before :each do
      @chef = Chef.create!(name: "Gordon Boyardee")

      @dish = Dish.create!(name: "Spaghetti and Meatballs",
                           description: "I mean it's in the name yo",
                           chef_id: @chef.id)

      @ingredient1 = @dish.ingredients.create!(name: "Spaghetti",
                                               calories: 100)

      @ingredient2 = @dish.ingredients.create!(name: "Meatballs",
                                               calories: 200)
    end

    it 'I see the dish name and description' do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it 'I see a lit of ingredients for that dish and the chefs name' do
      visit "/dishes/#{@dish.id}"

      within("#dish-ingredients") do
        expect(page).to have_content(@ingredient1.name)
        expect(page).to have_content(@ingredient2.name)
      end

      expect(page).to have_content(@chef.name)
    end

    it 'I see a total calorie count for that dish' do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content("Total Calories: 300")
    end
  end
end
