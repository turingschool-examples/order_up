require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the chef show page' do
    before(:each) do
      @susan = Chef.create(name: 'Susan Daly')

      @eggs = Ingredient.create(name: 'Scrambled egg', calories: 100)
      @noodles = Ingredient.create(name: 'Noodles', calories: 200)
      @rice = Ingredient.create(name: 'Rice', calories: 250)
      @chicken = Ingredient.create(name: 'Chicken', calories: 150)
      @soy_sauce = Ingredient.create(name: 'Soy sauce', calories: 50)
      @carrots = Ingredient.create(name: 'Carrots', calories: 50)

      @pad_thai = Dish.create(
        name: 'Pad Thai',
        description: 'A stir-fried rice noodle dish.',
        chef_id: @susan.id
      )
      DishIngredient.create(dish: @pad_thai, ingredient: @eggs)
      DishIngredient.create(dish: @pad_thai, ingredient: @noodles)
      DishIngredient.create(dish: @pad_thai, ingredient: @chicken)
      DishIngredient.create(dish: @pad_thai, ingredient: @soy_sauce)

      @fried_rice = Dish.create(
        name: 'Chicken Fried Rice',
        description: 'A stir-fried rice dish with eggs and carrots.',
        chef_id: @susan.id
      )
      DishIngredient.create(dish: @fried_rice, ingredient: @soy_sauce)
      DishIngredient.create(dish: @fried_rice, ingredient: @eggs)
      DishIngredient.create(dish: @fried_rice, ingredient: @rice)
      DishIngredient.create(dish: @fried_rice, ingredient: @chicken)
      DishIngredient.create(dish: @fried_rice, ingredient: @carrots)

    end

    it "I see the chef name and ingredients used link" do
      visit chef_path(@susan)

      within('.chef-info') do
        expect(page).to have_content(@susan.name)
      end

      click_link 'Ingredients Used'
      expect(current_path).to eq(chef_ingredients_path(@susan))
      expect(page).to have_content(@eggs.name, count: 1)
      expect(page).to have_content(@noodles.name, count: 1)
      expect(page).to have_content(@rice.name, count: 1)
      expect(page).to have_content(@chicken.name, count: 1)
      expect(page).to have_content(@soy_sauce.name, count: 1)
    end
  end
end
