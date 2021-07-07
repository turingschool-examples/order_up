require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "when I visit a chef show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Chef G")
      @pizza = @chef_1.dishes.create!(name: 'Pizza', description: 'Hand tossed with homemade sauce', total_calories: 750)
      @dough = @pizza.ingredients.create(name: 'Pizza Dough' )
      @sauce = @pizza.ingredients.create(name: 'Sauce' )
      @cheese = @pizza.ingredients.create(name: 'Cheese' )
      @pasta = @chef_1.dishes.create!(name: 'Pasta', description: 'Hand made tosed in sauce', total_calories: 1000)
      @dough_pasta = @pizza.ingredients.create(name: 'Pasta Dough' )
      @sauce = @pizza.ingredients.create(name: 'Sauce' )
      @sausage = @pizza.ingredients.create(name: 'Sausage' )
    end
    it "I see name of chef, link to view a list of all ingredients used in all dishes in ingredients index page" do
      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content(@chef_1.name)
      expect(page).to have_link("Chef's Ingredients")

      click_on "Chef's Ingredients"

      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredient_index")
      
      expect(page).to have_content(@dough.name)
      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@dough_pasta.name)
      expect(page).to have_content(@sausage.name)

    end
  end
end
