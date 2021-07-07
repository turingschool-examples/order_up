require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit a dish show page' do
    before :each do
      @chef_1 = Chef.create!(name: "Chef G")
      @pizza = @chef_1.dishes.create!(name: 'Pizza', description: 'Hand tossed with homemade sauce', total_calories: 750)
      @dough = @pizza.ingredients.create(name: 'Pizza Dough' )
      @sauce = @pizza.ingredients.create(name: 'Sauce' )
      @cheese = @pizza.ingredients.create(name: 'Cheese' )
    end
    it "I see dish name and description, a list of ingredients, and the chef's name" do

      visit "/dishes/#{@pizza.id}"

      expect(page).to have_content(@pizza.name)
      expect(page).to have_content(@pizza.description)

      @pizza.ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end

      expect(page).to have_content(@chef_1.name)

    end

    it "When I visit a dish's show page I see the total calorie count for that dish." do
      visit "/dishes/#{@pizza.id}"

      expect(page).to have_content(@pizza.total_calories)
    end
  end
end
