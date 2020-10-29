require "rails_helper"

describe "As a visitor" do
  describe "when I visit a chef's show page" do
    before :each do
      @emeril = Chef.create!(name: "Emeril Lagasse")

      @dish_1 = @emeril.dishes.create!(name: "Jalapeno Cornbread", description: "The cornbread has the perfect texture and the jalapenos add a great kick.")

      @corn = @dish_1.ingredients.create!(name: "corn", calories: 132)
      @milk = @dish_1.ingredients.create!(name: "milk", calories: 122)
      @jalapeno = @dish_1.ingredients.create!(name: "jalapeno", calories: 4)
      @flour = @dish_1.ingredients.create!(name: "flour", calories: 100)

      @dish_2 = @emeril.dishes.create!(name: "Bacon and Broccoli Mac and Cheese", description: "Seashell noodles make this a fun kid-friendly recipe.")

      @broccoli = @dish_2.ingredients.create!(name: "broccoli", calories: 150)
      @breadcrumbs = @dish_2.ingredients.create!(name: "breadcrumbs", calories: 275)
      @cheese = @dish_2.ingredients.create!(name: "cheese", calories: 500)
    end

    it "the visitor sees chef's name, and a link to chef's ingredient index page that lists names of all ingredients they use" do

      visit "/chefs/#{@emeril.id}"

      expect(page).to have_content(@emeril.name)

      click_link "All Ingredients"

      expect(current_path).to eq("/chefs/#{@emeril.id}/ingredients")

      expect(page).to have_content(@corn.name)
      expect(page).to have_content(@milk.name)
      expect(page).to have_content(@jalapeno.name)
      expect(page).to have_content(@flour.name)

      expect(page).to have_content(@broccoli.name)
      expect(page).to have_content(@breadcrumbs.name)
      expect(page).to have_content(@cheese.name)
    end
  end
end
