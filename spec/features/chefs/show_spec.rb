require "rails_helper"

describe "As a visitor" do
  describe "When i visit a chef show page" do
    before :each do
      @bob = Chef.create!(name: "Bob")

      @dish_1 = @bob.dishes.create!(name: "Dish 1", description: "particularly delicious")
      @dish_2 = @bob.dishes.create!(name: "Dish 2", description: "xtra delicious")
      @dish_3 = @bob.dishes.create!(name: "Dish 3", description: "massive delicious")
      
      @ingredient_1 = Ingredient.create!(name: "A", calories: 20)
      @ingredient_2 = Ingredient.create!(name: "B", calories: 10)
      @ingredient_3 = Ingredient.create!(name: "C", calories: 30)
      @ingredient_4 = Ingredient.create!(name: "D", calories: 50)
      
      Recipe.create!(dish: @dish_1, ingredient: @ingredient_1, ingredient_quantity: 2)
      Recipe.create!(dish: @dish_1, ingredient: @ingredient_3, ingredient_quantity: 3)
      
      Recipe.create!(dish: @dish_2, ingredient: @ingredient_1, ingredient_quantity: 2)
      
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_2, ingredient_quantity: 1)
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_3, ingredient_quantity: 1)
      Recipe.create!(dish: @dish_3, ingredient: @ingredient_3, ingredient_quantity: 1)
    end
    it 'I see the chefs name and a link to their ingredients used' do
      visit chef_path(@bob.id)
  
      within("#chef") do 
        expect(page).to have_content(@bob.name)
        expect(page).to have_link("#{@bob.name}'s Ingredients")
      end
    end

    it 'shows the chefs most popular ingredients' do
      visit chef_path(@bob.id)

      within("#top-ingredients") do
        expect(page).to have_content("Top 3 Ingredients")
        expect(@ingredient_3.name).to appear_before(@ingredient_1.name) 
        expect(@ingredient_1.name).to appear_before(@ingredient_2.name) 
      end
    end
  end
end