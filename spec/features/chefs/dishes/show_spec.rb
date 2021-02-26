require 'rails_helper'

RSpec.describe "When I visit  a dish's show page" do
  before :each do
    @ina = Chef.create!(name: "Ina Garten")
    @spaghetti = @ina.dishes.create!(name: "Famous Spaghetti", description: "Flavorful marinara over bed of spaghetti")
    @tomatoes = @spaghetti.ingredients.create!(name: "Tomatoes", calories: 100)
    @spaghetti_pasta = @spaghetti.ingredients.create!(name: "Spaghetti Pasta", calories: 450)
    @italian_herbs = @spaghetti.ingredients.create!(name: "Italian Herbs", calories: 5)
    @salt = @spaghetti.ingredients.create!(name: "Salt", calories: 5)
    @parmesan = @spaghetti.ingredients.create!(name: "Parmesan", calories: 100)
    @apple = Ingredient.create!(name: "Apple", calories: 85)
  end

  it 'I see the dishes name and description' do
    visit chef_dish_path(@ina, @spaghetti)

    expect(page).to have_content("#{@spaghetti.name}")
    expect(page).to have_content("#{@spaghetti.description}")
  end

  it 'I see a list of ingredients for that dish' do
    visit chef_dish_path(@ina, @spaghetti)
    spaghetti_tomatoes = @tomatoes.dish_ingredients.first
    s_spaghetti_pasta = @spaghetti_pasta.dish_ingredients.first

    within ".ingredients" do
      expect(page.all('li', count:5))
      within "#dish_ingredient-#{spaghetti_tomatoes.id}" do
        expect(page).to have_content("#{@tomatoes.name}")
      end
      within "#dish_ingredient-#{s_spaghetti_pasta.id}" do
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
    visit chef_dish_path(@ina, @spaghetti)

    expect(page).to have_content("Made by Chef: #{@ina.name}")
    expect(page).to have_content("Total Calories: #{@spaghetti.total_calories}")
  end

  it "next to each ingredient there is a button to remove that ingredient" do
    visit chef_dish_path(@ina, @spaghetti)
    spaghetti_tomatoes = @tomatoes.dish_ingredients.first

    within ".ingredients" do
      within "#dish_ingredient-#{spaghetti_tomatoes.id}" do
        expect(page).to have_button("Remove Ingredient")
      end
    end
  end

  it "when I click 'Remove Ingredient' I am brought back to dish show page and no longer see that ingredient" do
    visit chef_dish_path(@ina, @spaghetti)
    spaghetti_parm = @parmesan.dish_ingredients.first

    within ".ingredients" do
      within "#dish_ingredient-#{spaghetti_parm.id}" do
        click_button("Remove Ingredient")
      end
    end

    expect(current_path).to eq("/chefs/#{@ina.id}/dishes/#{@spaghetti.id}")
    expect(page).to_not have_content("#{@parmesan.name}")
  end
end
