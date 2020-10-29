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

    it 'has the three most popular ingredients that chef uses' do
      ingredient4 = @dish1.ingredients.create(name: "Pickles",
                                              calories: 10)

      ingredient5 = @dish2.ingredients.create(name: "Pepperoni",
                                              calories: 21)

      ingredient6 = @dish3.ingredients.create(name: "Marinara",
                                              calories: 12)

      @dish2.ingredients << ingredient5
      @dish1.ingredients << ingredient6

      visit "/chefs/#{@chef.id}"

      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(ingredient5.name)
      expect(page).to have_content(ingredient6.name)
      expect(page).to_not have_content(@ingredient.name)
      expect(page).to_not have_content(ingredient4.name)
    end
  end
end

