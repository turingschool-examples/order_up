require "rails_helper"

describe "As a visitor" do
  describe "When I visit a dish's show page" do
    it "shows the dish's name and description, a list of ingredients, and the chef's name" do
      chef = Chef.create(name: "Gordon Ramsay")
      spaghetti = chef.dishes.create(name: "Spaghetti", description: "A light, classical pasta dish with succulent tomato sauce and zesty home-made meatballs")
      pasta = spaghetti.ingredients.create(name: "Pasta", calories: 1200)
      basil = spaghetti.ingredients.create(name: "Basil", calories: 20)
      meatball = spaghetti.ingredients.create(name: "Meatball", calories: 600)
      tomato = spaghetti.ingredients.create(name: "Tomato", calories: 60)

      visit dish_path(spaghetti)

      expect(page).to have_content("#{spaghetti.description}")
      expect(page).to have_content("#{spaghetti.name}")
      expect(page).to have_content("Ingredients:")
      expect(page).to have_content(tomato.name)
      expect(page).to have_content(basil.name)
      expect(page).to have_content(pasta.name)
      expect(page).to have_content(meatball.name)
      expect(page).to have_content(chef.name)
      expect(page).to have_content("Total calories: 1880")
    end
  end
end
