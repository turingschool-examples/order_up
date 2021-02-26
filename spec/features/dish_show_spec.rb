require 'rails_helper'
RSpec.describe 'As a user, when I visit a dishes show page', type: :feature do
  before :each do
    @chef_1 = Chef.create!(name: "Jim")
    @dish_1 = Dish.create!(chef_id: @chef_1.id, name: "Pasta", description: "Noodles and Sauce")
    @dish_2 = Dish.create!(chef_id: @chef_1.id, name: "Fried chicken", description: "Tasty yum yum")
    @dish_3 = Dish.create!(chef_id: @chef_1.id, name: "Fish", description: "Pescado suprema")
    @dish_4 = Dish.create!(chef_id: @chef_1.id, name: "Salad", description: "get yer veggies")

    @chef_1.dishes << [@dish_1, @dish_2, @dish_3, @dish_4]

    @ingredient_1 = Ingredient.create!(name: "butter", calories: 100)
    @ingredient_2 = Ingredient.create!(name: "fish", calories: 25)
    @ingredient_3 = Ingredient.create!(name: "chicken", calories: 35)
    @ingredient_4 = Ingredient.create!(name: "flour", calories: 10)
    @ingredient_5 = Ingredient.create!(name: "lettuce", calories: 10)
    @ingredient_6 = Ingredient.create!(name: "lemon", calories: 5 )
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id)
    DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_6.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_3.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_6.id)
    DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_6.id)
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_6.id)
    DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_5.id)
    DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_6.id)
  end
  it 'I see the dish’s name and description' do

    # require "pry"; binding.pry
    visit dish_path(@dish_1)
save_and_open_page
    # within('#dish_info') do
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
      expect(page).to have_content(@dish_1.ingredient_names)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to have_content(@ingredient_6.name)
      # expect(page).to have_content(@chef_1.name)
      # expect(page).to have_content(@ingredient_1.calories.count)
      # expect(page).to have_content(@ingredient_4.calories.count)
      # expect(page).to have_content(@ingredient_6.calories.count)
    # end
  end
end
#
# And I see a list of ingredients for that dish
# And I see the chef's name
# Abd I see the total calorie count for that dish.
