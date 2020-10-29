require 'rails_helper'

describe "Chef Show Page" do
  before(:each) do
    @elzar = Chef.create!(
      name: 'Elzar'
    )
    @canned_gumbo = Ingredient.create!(
      name: "1x Can of Elzar's Down Home Neptunian Gumbo",
      calories: 2000
    )
    @slug = Ingredient.create!(
      name: "1x Purple Neptunian Slug",
      calories: 5000
    )
    @noodles = Ingredient.create!(
      name: "noodles",
      calories: 5000
    )
    @gumbo = @elzar.dishes.create!(
      name: "Elzar's Down Home Neptunian Gumbo",
      description: "Causes horrible, nightmarish diarrhea.",
    )
    @pasta = @elzar.dishes.create!(
      name: "Pasta",
      description: "Causes horrible, nightmarish diarrhea.",
    )
    @gumbo.ingredients << @canned_gumbo
    @gumbo.ingredients << @slug
    @pasta.ingredients << @noodles
  end
  describe "As a visitor" do
    describe "When I visit a chef's show page" do
      it "I see the name of that chef" do
        visit "/chefs/#{@elzar.id}"

        expect(page).to have_content("Chef #{@elzar.name}")
      end
      it "I see a link to view a list of all ingredients that this chef uses in their dishes" do
        visit "/chefs/#{@elzar.id}"

        expect(page).to have_link("All ingredients")
      end
      describe "When I click on the link to see all ingredient" do
        it "I'm taken to a chef's ingredient index page" do
          visit "/chefs/#{@elzar.id}"

          click_link("All ingredients")
          expect(current_pate).to eq("/chefs/#{@elzar.id}/ingredients")
        end
        it "I can see a unique list of names of all the ingredients that this chef uses" do
          expect(page).to have_content(@canned_gumbo.name)
          expect(page).to have_content(@slug.name)
          expect(page).to have_content(@noodles.name)
        end
      end
    end
  end
end
