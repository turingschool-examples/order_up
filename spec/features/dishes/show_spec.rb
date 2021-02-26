require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before :each do
    @chef1 = Chef.create!(name: "Peter")
    @dish1 = @chef1.dishes.create!(name: "Mac n Cheese", description: "Delicious!, but high in calories")
    @ingredient1 = @dish1.ingredients.create!(name: "Elbow Pasta", calories: 80)
    @ingredient2 = @dish1.ingredients.create!(name: "Cheddar Cheese", calories: 180)
    @ingredient3 = @dish1.ingredients.create!(name: "Butter", calories: 150)

    @chef2 = Chef.create!(name: "Tony")
    @dish2 = @chef2.dishes.create!(name: "Cheese Pizza", description: "Best Pizza in town")
    @ingredient4 = @dish2.ingredients.create!(name: "Dough", calories: 120)
    @ingredient5 = @dish2.ingredients.create!(name: "Mozzarella Cheese", calories: 160)
    @ingredient6 = @dish2.ingredients.create!(name: "Pizza Sauce", calories: 100)
  end
  describe "As a visitor" do
    describe "When I visit a dish's show page" do
      it "I see the dish’s name and description" do
        visit "/dishes/#{@dish1.id}"
          within "#dish-info" do
            expect(page).to have_content(@dish1.name)
            expect(page).to have_content(@dish1.description)
            expect(page).to_not have_content(@dish2.name)
            expect(page).to_not have_content(@dish2.description)
          end
      end
      it "I see a list of ingredients for that dish" do
        visit "/dishes/#{@dish1.id}"
          within "#dish-ingredients" do
            expect(page).to have_content(@ingredient1.name)
            expect(page).to have_content(@ingredient2.name)
            expect(page).to have_content(@ingredient3.name)
            expect(page).to_not have_content(@ingredient4.name)
            expect(page).to_not have_content(@ingredient5.name)
            expect(page).to_not have_content(@ingredient6.name)
          end
      end
      it "I see the chef's name" do
        visit "/dishes/#{@dish1.id}"
          within "#dish-chef" do
            expect(page).to have_content(@dish1.chef.name)
            expect(page).to_not have_content(@dish2.chef.name)
          end
      end
      it "I see the total calorie count for that dish" do
        visit "/dishes/#{@dish1.id}"
          within "#dish-calories" do
            expect(page).to have_content(@dish1.total_calories)
            expect(page).to_not have_content(@dish2.total_calories)
          end
      end
    end
  end
end