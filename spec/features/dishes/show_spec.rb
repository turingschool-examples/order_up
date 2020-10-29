require "rails_helper"

describe "as a visitor" do
  describe "when I visit a dish's show page" do
    before :each do
      @chef = Chef.create!(name: "Chef")

      @ravioli = @chef.dishes.create!(name: "Ravioli", description: "Spinach Ravioli")

      @pasta = Ingredient.create!(name: "Pasta", quantity: 1, units: "cups", calories_per_unit: 100)
      @cheese = Ingredient.create!(name: "Cheese", quantity: 5, units: "cups", calories_per_unit: 500)
      @spinach = Ingredient.create!(name: "Spinach", quantity: 2, units: "cups", calories_per_unit: 50)

      @ravioli_ingredients = [@pasta, @cheese, @spinach]

      @ravioli.ingredients << @ravioli_ingredients

      visit dish_path(@ravioli)
    end

    it "There is a list of ingredients for that dish and the name of the chef" do
      within ".#{@ravioli.name}-ingredients" do
        expect(page).to have_content("#{@ravioli.name} Ingredients:")
        expect(page).to have_content("#{@pasta.name}")
        expect(page).to have_content("#{@cheese.name}")
        expect(page).to have_content("#{@spinach.name}")
      end
      expect(page).to have_content("#{@ravioli.name}, by Chef #{@chef.name}")
    end
  end
end
