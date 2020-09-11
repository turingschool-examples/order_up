require "rails_helper"

RSpec.describe "Dish show page", type: :feature do
  describe "As a visitor to dish show page" do
    before :each do
      @chef = Chef.create(name: "Mike Dao")
      @dish = @chef.dishes.create(name: "Pizza", description: "Delicious", ingredients: "Pepperoni and Cheese")
    end
    it "I can see a the dish's name and description" do


      visit "/dish/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end

    it "I can see a list of ingredients for that dish" do
      visit "/dish/#{@dish.id}"

      expect(page).to have_content(@dish.ingredients)
    end

    it "I can see the chef's name" do
      visit "/dish/#{@dish.id}"
      expect(page).to have_content(@chef.name)
    end
  end
end
