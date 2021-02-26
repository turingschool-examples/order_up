require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @chef = Chef.create!(name: "Big Sloppy Sal")
    @dish_1 = @chef.dishes.create!(name: "Pizza", description: "Better than your mothers!")

    @sauce = Ingredient.create!(name: "tomatoe sauce", calories: 50)
    @cheese = Ingredient.create!(name: "cheese", calories: 150)
    @dough = Ingredient.create!(name: "pizza dough", calories: 100)

    DishIngredient.create!(dish: @dish_1, ingredient: @sauce)
    DishIngredient.create!(dish: @dish_1, ingredient: @cheese)
    DishIngredient.create!(dish: @dish_1, ingredient: @dough)
  end

  describe "when I visit a dish show page" do
    it "shows me all the dish info including the calories and chef name" do

      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content("Dish Name")
      expect(page).to have_content(@dish_1.name)

      expect(page).to have_content("Chef Name")
      expect(page).to have_content(@chef.name)

      expect(page).to have_content("List of ingredients")
      expect(page).to have_content(@sauce.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@dough.name)


      expect(page).to have_content("Total calories")
      expect(page).to have_content("#{(@sauce.calories + @cheese.calories + @dough.calories)}")

    end

    it "next to each ingredient is a button to remove the ingredient and when I click it the ingredient is gone" do

      visit "/dishes/#{@dish_1.id}"
      expect(page).to have_content(@dough.name)

      expect(page).to have_button 'remove pizza dough'

      click_button 'remove pizza dough'
      expect(page).to have_no_content(@dough.name)

    end
  end
end
