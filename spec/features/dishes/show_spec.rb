require 'rails_helper'

describe "dish show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Bob")
    @dish_1 = Dish.create!(name: "Gouda Burger", description: "Delicious goodness", chef_id: "#{@chef_1.id}")
    @ingr_1 = Ingredient.create!(name: "beef patty", calories: 800)
    @ingr_2 = Ingredient.create!(name: "gouda cheese", calories: 300)
    @ingr_3 = Ingredient.create!(name: "onion", calories: 50)
    @ingr_4 = Ingredient.create!(name: "bun", calories: 200)
    @dish_1.ingredients << @ingr_1
    @dish_1.ingredients << @ingr_2
    @dish_1.ingredients << @ingr_3
    @dish_1.ingredients << @ingr_4
  end
  it "can see the dish's name, description, list of ingredients for that dish, and chef's name" do
    visit "/dishes/#{@dish_1.id}"

    within("#dish-info") do
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
    end

    within("#ingredients-info") do
      expect(page).to have_content(@ingr_1.name)
      expect(page).to have_content(@ingr_2.name)
      expect(page).to have_content(@ingr_3.name)
      expect(page).to have_content(@ingr_4.name)
      expect(page).to have_content(@dish_1.ingredients.calorie_total)
    end

    within("#chef") do
      expect(page).to have_content(@chef_1.name)
    end
  end
end
