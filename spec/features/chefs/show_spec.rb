require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "when I visit a chef show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Chef G")
      @pizza = @chef_1.dishes.create!(name: 'Pizza', description: 'Hand tossed with homemade sauce', total_calories: 750)
      @dough = @pizza.ingredients.create(name: 'Pizza Dough' )
      @sauce = @pizza.ingredients.create(name: 'Sauce' )
      @cheese = @pizza.ingredients.create(name: 'Cheese' )
    end
    it "I see a unique list of all ingredient names the chef uses" do
        visit "/chefs/#{@chef_1.id}"

        @chef_1.dishes.each do |dish|
          dish.ingredients.each do |ingredient|
            expect(page).to have_content(ingredient.name)
          end
        end
    end
  end
end
