require 'rails_helper'

RSpec.describe 'Chef show page' do
  describe 'As a visitor' do
    before(:each) do
      @taiki = Chef.create!(name: "Joseph Taiki")
      @onion_soup = @taiki.dishes.create!(name: "Onion Soup", description: "Homemade taste with organic and local grown ingredients. Vegetarian and Vegan options available!")
      @onion = @onion_soup.ingredients.create!(name: "White Onion", calories: 5)
      @broth = @onion_soup.ingredients.create!(name: "Hearty Veggie Broth", calories: 10)
      @cheese = @onion_soup.ingredients.create!(name: "Vegan Cheese", calories: 25)
      @carrots = @onion_soup.ingredients.create!(name: "Diced Carrots", calories: 5)

      @tacos = @taiki.dishes.create!(name: "Vegan Tacos", description: "Vegan options only. These delicious tacos are made with fresh tortillas, and a secret spice blend.")
      @onion = @tacos.ingredients.create!(name: "White Onion", calories: 5)
      @avocado = @tacos.ingredients.create!(name: "Avocado", calories: 20)
      @cheese = @tacos.ingredients.create!(name: "Vegan Cheese", calories: 25)
      @lettuce = @tacos.ingredients.create!(name: "Shredded Lettuce", calories: 5)
      @carrots = @tacos.ingredients.create!(name: "Diced Carrots", calories: 5)
    end

    it 'I see the name of that chef' do
      visit chef_path(@taiki)

      expect(page).to have_content("Chef's Name: #{@taiki.name}")
    end

    it 'And I see a link to view a list of all ingredients that this chef uses in their dishes' do
      visit chef_path(@taiki)

      expect(page).to have_link("View Ingredients Used")
    end

    it "When I click on that link I'm taken to a chef's ingredient index page" do
      visit chef_path(@taiki)
      click_link("View Ingredients Used")

      expect(current_path).to eq(chef_ingredients_path(@taiki.id))
    end

    it 'and I can see a unique list of names of all the ingredients that this chef uses' do
      visit chef_ingredients_path(@taiki.id)

      expect(page).to have_content(@taiki.list_unique_ingredients_used)
    end
  end
end
