require 'rails_helper'

RSpec.describe "When I visit  a dish's show page" do
  before :each do
    @ina = Chef.create!(name: "Ina Garten")
    @spaghetti = @ina.dishes.create!(name: "Famous Spaghetti", description: "Flavorful marinara over bed of spaghetti")
    @tomatoes = @spaghetti.ingredients.create!(name: "Tomatoes", calories: 100)
    @spaghetti_pasta = @spaghetti.ingredients.create!(name: "Spaghetti Pasta", calories: 450)
    @italian_herbs = @spaghetti.ingredients.create!(name: "Italian Herbs", calories: 5)
    @salt = @spaghetti.ingredients.create!(name: "Salt", calories: 5)
    @parmesan = @spaghetti.ingredients.create!(name: "parmesan", calories: 100)
    @apple = Ingredient.create!(name: "Apple", calories: 85)
  end

  it 'I see the dishes name and description' do
    visit chef_dish_path(@ina, @spaghetti)

    expect(page).to have_content("#{@spaghetti.name}")
    expect(page).to have_content("#{@spaghetti.description}")
  end

  it 'I see a list of ingredients for that dish' do
    visit chef_dish_path(@ina, @spaghetti)

    within ".ingredients" do
      expect(page.all('li', count:5))
      within "#ingredient-#{@tomatoes.id}" do
        expect(page).to have_content("#{@tomatoes.name}")
      end
      within "#ingredient-#{@spaghetti_pasta.id}" do
        expect(page).to have_content("#{@spaghetti_pasta.name}")
      end
    end
  end

  it 'I do not see an ingredient that is not in this dish' do
    visit chef_dish_path(@ina, @spaghetti)

    within ".ingredients" do
      expect(page).to_not have_content("#{@apple.name}")
    end
  end

  it "I see the chef's name and total calorie count for that dish" do

  end
end
