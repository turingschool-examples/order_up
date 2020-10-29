require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit a chefs show page' do
    before :each do
      @chef = Chef.create!(name: "Guy Ramsey")

      @dish1 = @chef.dishes.create!(name: 'Burger Bomb',
                                    description: 'An explosion of flavor!')
                                    
      @dish2 = @chef.dishes.create!(name: 'Pizza Pizzazz',
                                    description: 'Pizzapizzapizzapizza')

      @dish3 = @chef.dishes.create!(name: 'Ravenous Ravioli',
                                    description: 'Eat it before it eats you!')

      @ingredient = @dish1.ingredients.create!(name: "Ground Beef",
                                               calories: "100")

      @ingredient2 = @dish2.ingredients.create!(name: "Cheese",
                                                calories: "50")

      @dish3.ingredients << @ingredient2
      @dish1.ingredients << @ingredient2
    end

    it 'has the name of that chef' do
      visit "/chefs/#{@chef.id}"

      expect(page).to have_content(@chef.name)
    end

    it 'has a link to a list of all ingredients that chef uses' do
      visit "/chefs/#{@chef.id}"

      click_link("View Ingredients")
      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
      expect(page).to have_content(@ingredient.name)
      expect(page).to have_content(@ingredient2.name)
    end
  end
end

