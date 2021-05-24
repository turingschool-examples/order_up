require 'rails_helper'

RSpec.describe "When I visit  a chef's ingredients index page" do
  before :each do
    @ina = Chef.create!(name: "Ina Garten")
    @spaghetti = @ina.dishes.create!(name: "Famous Spaghetti", description: "Flavorful marinara over bed of spaghetti")
    @tomatoes = @spaghetti.ingredients.create!(name: "Tomatoes", calories: 100)
    @spaghetti_pasta = @spaghetti.ingredients.create!(name: "Spaghetti Pasta", calories: 450)
    @italian_herbs = @spaghetti.ingredients.create!(name: "Italian Herbs", calories: 5)
    @salt = @spaghetti.ingredients.create!(name: "Salt", calories: 5)
    @parmesan = @spaghetti.ingredients.create!(name: "parmesan", calories: 100)

    @applesauce = @ina.dishes.create!(name: "Cinnamon Applesauce", description: "Slightly sweetened tangy cinnamon applesauce")
    @apple = @applesauce.ingredients.create!(name: "Apple", calories: 85)
    @cinnamon = @applesauce.ingredients.create!(name: "Cinnamon", calories: 0)
    @sugar = @applesauce.ingredients.create!(name: "Sugar", calories: 40)
    @applesauce.ingredients << @salt
  end

  it 'I see a unique list of all ingredients this chef uses' do
    visit chef_ingredients_path(@ina)

    expect(page).to have_content("#{@ina.name}'s Ingredients")

    within '.ingredients' do
      expect(page.all('li', count:8))
      expect(page.all('li', text: "Salt").count).not_to eq(2)

      within "#ingredient-#{@spaghetti_pasta.id}" do
        expect(page).to have_content("#{@spaghetti_pasta.name}")
      end

      within "#ingredient-#{@apple.id}" do
        expect(page).to have_content("#{@apple.name}")
      end
    end
  end
end
