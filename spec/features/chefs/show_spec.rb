require "rails_helper"

describe "As a visitor" do
  describe "when I visit a chefs show page" do
    before :each do
      @chef = Chef.create!(name: "Chef")

      @ravioli = @chef.dishes.create!(name: "Ravioli", description: "Spinach Ravioli")
      @pasta = Ingredient.create!(name: "Pasta", quantity: 1, units: "cups", calories_per_unit: 100)
      @cheese = Ingredient.create!(name: "Cheese", quantity: 5, units: "cups", calories_per_unit: 500)
      @spinach = Ingredient.create!(name: "Spinach", quantity: 2, units: "cups", calories_per_unit: 50)
      @ravioli_ingredients = [@pasta, @cheese, @spinach]
      @ravioli.ingredients << @ravioli_ingredients

      @coffee = @chef.dishes.create!(name: "Coffee", description: "Hot")
      @water = Ingredient.create!(name: "Water", quantity:1, units: "cups", calories_per_unit: 0)
      @coffe_bean = Ingredient.create!(name: "Folgers", quantity:1, units: "cups", calories_per_unit: 100)
      @coffee_ingredients = [@water, @coffe_bean]
      @coffee.ingredients << @coffee_ingredients

      visit chef_path(@chef)
    end

    it "There is the name of that chef and a link to their ingredients which takes me to chef's ingredient index page" do
      expect(page).to have_content("Chef: #{@chef.name}")
      expect(page).to have_link("Ingredients")

      click_link "Ingredients"

      expect(current_path).to eq(chef_ingredients_path(@chef))
      expect(page).to have_content("Ingredients used by #{@chef.name}")
      expect(page).to have_content("#{@pasta.name}")
      expect(page).to have_content("#{@cheese.name}")
      expect(page).to have_content("#{@spinach.name}")
      expect(page).to have_content("#{@water.name}")
      expect(page).to have_content("#{@coffe_bean.name}")
    end
  end
end
