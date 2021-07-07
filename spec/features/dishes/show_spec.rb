require "rails_helper"

describe "As a visitor" do
  describe "when I visit a dish's show page" do
    before :each do
      @chef_1 = Chef.create!(name: "Emeril Lagasse")
      @dish_1 = @chef_1.dishes.create!(name: "Jalapeno Cornbread", description: "The cornbread has the perfect texture and the jalapenos add a great kick.")
      @corn = @dish_1.ingredients.create!(name: "corn", calories: 132)
      @milk = @dish_1.ingredients.create!(name: "milk", calories: 122)
      @jalapeno = @dish_1.ingredients.create!(name: "jalapeno", calories: 4)
      @flour = @dish_1.ingredients.create!(name: "flour", calories: 100)
    end

    it "the visitor sees dish's name and description, list of ingredients, and chef's name" do

      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)

      expect(page).to have_content(@corn.name)
      expect(page).to have_content(@milk.name)
      expect(page).to have_content(@jalapeno.name)
      expect(page).to have_content(@flour.name)

      expect(page).to have_content(@chef_1.name)
    end

    it "the visitor sees the total calorie count for that dish" do
      visit "/dishes/#{@dish_1.id}"

      expect(page).to have_content("Total Calorie Count: #{@dish_1.total_calories}")
    end
  end
end
