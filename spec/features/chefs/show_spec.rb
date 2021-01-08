require 'rails_helper'

describe 'As a visitor' do
  describe "When I visit a chef's show page" do
    before :each do
      @chef_ryan = Chef.create!(name: 'Ryan')

      visit "/chefs/#{@chef_ryan.id}"
    end

    it 'I see the name of that chef' do
      expect(page).to have_content("Chef Name: #{@chef_ryan.name}")
    end

    it 'I see a link to view a list of all ingredients that this chef uses in their dishes' do
      expect(page).to have_link('Chef Ingredients')
    end

    describe 'When I click on that link' do
      it "I'm taken to a chef's ingredient index page" do
        click_link 'Chef Ingredients'

        expect(current_path).to eq("/chefs/#{@chef_ryan.id}/ingredients")
      end
    end

    it 'I see the three most popular ingredients that the chef uses in their dishes' do
      @pizza = @chef_ryan.dishes.create!(name: 'Pizza', description: 'Cheesy goodness')
      @taco = @chef_ryan.dishes.create!(name: 'Taco', description: 'Taco description...')
      @steak = @chef_ryan.dishes.create!(name: 'Steak', description: 'Steak description...')
      @bread = @chef_ryan.dishes.create!(name: 'Bread', description: 'Bread description...')

      @dough = Ingredient.create!(name: 'Dough', calories: 100)
      @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
      @anchovy = Ingredient.create!(name: 'Anchovy', calories: 150)
      @lettuce = Ingredient.create!(name: 'Lettuce', calories: 30)
      @beef = Ingredient.create!(name: 'Beef', calories: 180)

      @pizza.dish_ingredients.create!(ingredient_id: @dough.id)
      @pizza.dish_ingredients.create!(ingredient_id: @cheese.id)

      @taco.dish_ingredients.create!(ingredient_id: @cheese.id)
      @taco.dish_ingredients.create!(ingredient_id: @beef.id)
      @taco.dish_ingredients.create!(ingredient_id: @lettuce.id)

      @steak.dish_ingredients.create!(ingredient_id: @beef.id)

      @bread.dish_ingredients.create!(ingredient_id: @dough.id)

      visit "/chefs/#{@chef_ryan.id}"
      
      within '.top-three-ingredients' do
        expect(page).to have_content(@cheese.name)
        expect(page).to have_content(@beef.name)
        expect(page).to have_content(@dough.name)
      end
    end
  end
end
