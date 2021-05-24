require 'rails_helper'

RSpec.describe "When I visit  a chef's show page" do
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

  it 'I see the name of that chef' do
    visit chef_path(@ina)

    expect(page).to have_content("#{@ina.name}")
  end

  describe 'I see a link to view a list of all ingredients that this chef uses in their dishes' do
    it "when I click that link I'm taken to a chef's ingredient index page" do
      visit chef_path(@ina)

      expect(page).to have_link("Chef Ingredients")
      click_link "Chef Ingredients"
      expect(current_path).to eq("/chefs/#{@ina.id}/ingredients")
    end
  end
end
