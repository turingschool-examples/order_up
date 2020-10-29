require 'rails_helper'

describe "Dish Show page" do
  describe "As a visitor" do
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
      @gumbo = @elzar.dishes.create!(
        name: "Elzar's Down Home Neptunian Gumbo",
        description: "Causes horrible, nightmarish diarrhea.",
      )
      @gumbo.ingredients << @canned_gumbo
      @gumbo.ingredients << @slug

      visit "/dishes/#{@gumbo.id}"
    end
    describe "When I visit a dish's show page" do
      it "I see the dish's name and description" do
        expect(page).to have_content(@gumbo.name)
        expect(page).to have_content(@gumbo.description)
      end
      it "I see a list of ingredients for that dish" do
        within '#ingredients' do
          expect(page).to have_content(@canned_gumbo.name)
          expect(page).to have_content(@slug.name)
        end
      end
      it "I see the chef's name" do
        expect(page).to have_content("By: Chef #{@elzar.name}")
      end
    end
  end
end
