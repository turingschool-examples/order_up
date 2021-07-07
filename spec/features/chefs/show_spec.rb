require "rails_helper"

describe "As a visitor" do
  describe "When I visit a chef's show page" do
    before :each do
      @chef = Chef.create(name: "Gordon Ramsay")
      @spaghetti = @chef.dishes.create(name: "Spaghetti", description: "A light, classical pasta dish with succulent tomato sauce and zesty home-made meatballs")
      @stroganoff = @chef.dishes.create(name: "Beef Stroganoff", description: "A beef dish guaranteed to excite any pasta lover!")
      @pasta = @spaghetti.ingredients.create(name: "Pasta", calories: 1200)
      @basil = @spaghetti.ingredients.create(name: "Basil", calories: 20)
      @meatball = @spaghetti.ingredients.create(name: "Meatball", calories: 600)
      @tomato = @spaghetti.ingredients.create(name: "Tomato", calories: 60)
      @milk = @stroganoff.ingredients.create(name: "Milk", calories: 50)
      @beef = @stroganoff.ingredients.create(name: "Ground Beef", calories: 500)
      @bowtie = @stroganoff.ingredients.create(name: "Bowtie Pasta", calories: 1500)
      @parmesan = Ingredient.create(name: "Parmesan cheese", calories: 200)
      @spaghetti.recipes.create(ingredient_id: @parmesan.id)
      @stroganoff.recipes.create(ingredient_id: @parmesan.id)
    end

    it "shows the chef's name and a link to all ingredients the chef uses" do
      visit chef_path(@chef)

      expect(page).to have_content(@chef.name)
      expect(page).to have_link(chef_ingredients_path(@chef))
      click_link("Ingredients this Chef uses")
      expect(current_path).to eq(chef_ingredients_path(@chef))
    end
  end
end
