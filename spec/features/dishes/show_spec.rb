require 'rails_helper'

RSpec.describe 'Dishes show page' do
  before :each do
    set_up
  end

  it 'show page has dish info' do
    visit "/dishes/#{@fish.id}"

    expect(page).to have_content(@fish.name)
    expect(page).to have_content(@fish.description)
    expect(page).to have_content(@fish.name)

    within ".ingredient-#{@salmon.id}" do
      expect(page).to have_content(@salmon.name)
    end

    within ".ingredient-#{@potatoes.id}" do
      expect(page).to have_content(@potatoes.name)
    end
  end

  it 'show page has chef and calorie count' do
    visit "/dishes/#{@fish.id}"

    expect(page).to have_content(@jon.name)
    expect(page).to have_content(@fish.total_calories)
  end

  it 'has a button to that removes an ingredient from the dish' do
    visit "/dishes/#{@fish.id}"

    within ".ingredient-#{@salmon.id}" do
      expect(page).to have_button("Remove Ingredient")
      click_button("Remove Ingredient")
      expect(current_path).to eq("/dishes/#{@fish.id}")
    end

    expect(page).to_not have_content(@salmon.name)

    within ".ingredient-#{@potatoes.id}" do
      expect(page).to have_button("Remove Ingredient")
      click_button("Remove Ingredient")
      expect(current_path).to eq("/dishes/#{@fish.id}")
    end

    expect(page).to_not have_content(@potatoes.name)
  end

  def set_up
    @jon = Chef.create!(name: "Jon Favreau")
    @gordon = Chef.create!(name: "Gordon Ramsey")

    @fish = @jon.dishes.create!(name: "Fishy Dinner", description: "Delicious food")
    @cuban = @jon.dishes.create!(name: "Cuban Sandwich", description: "My specialty")
    @tacos = @jon.dishes.create!(name: "Street Tacos", description: "A taste of mexico")

    @burger = @gordon.dishes.create!(name: "Ultimate Burger", description: "Best burger ever")
    @wellington = @gordon.dishes.create!(name: "Beef Wellington", description: "My favorite meal to make")
    @f_chips = @gordon.dishes.create!(name: "Fish and Chips", description: "A taste of my home")

    @salmon = Ingredient.create!(name: "Salmon", calories: 250)
    @cod = Ingredient.create!(name: "Cod", calories: 175)
    @bread = Ingredient.create!(name: "Bread", calories: 300)
    @steak = Ingredient.create!(name: "Steak", calories: 600)
    @guac = Ingredient.create!(name: "Guac", calories: 75)
    @potatoes = Ingredient.create!(name: "Potatoes", calories: 500)
    @tortillas = Ingredient.create!(name: "Tortillas", calories: 200)
    @beef = Ingredient.create!(name: "Beef", calories: 250)
    @pork = Ingredient.create!(name: "Pork", calories: 225)
    @pastry = Ingredient.create!(name: "Pastry Dough", calories: 330)

    DishIngredient.create!(dish: @fish, ingredient: @salmon)
    DishIngredient.create!(dish: @fish, ingredient: @potatoes)
    DishIngredient.create!(dish: @f_chips, ingredient: @cod)
    DishIngredient.create!(dish: @f_chips, ingredient: @potatoes)
    DishIngredient.create!(dish: @cuban, ingredient: @bread)
    DishIngredient.create!(dish: @cuban, ingredient: @pork)
    DishIngredient.create!(dish: @tacos, ingredient: @tortillas)
    DishIngredient.create!(dish: @tacos, ingredient: @steak)
    DishIngredient.create!(dish: @tacos, ingredient: @guac)
    DishIngredient.create!(dish: @burger, ingredient: @beef)
    DishIngredient.create!(dish: @burger, ingredient: @bread)
    DishIngredient.create!(dish: @wellington, ingredient: @beef)
    DishIngredient.create!(dish: @wellington, ingredient: @pastry)
  end
end
