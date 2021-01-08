require 'rails_helper'

RSpec.describe "Chef Show" do
  let(:chef) {Chef.create!(name: "Martha Stewart")}
  let!(:ingredient_1) {Ingredient.create(name: "macaroni", calories: 390)}
  let!(:ingredient_2) {Ingredient.create(name: "cheese", calories: 531)}
  let!(:ingredient_3) {Ingredient.create(name: "cream", calories: 28)}
  let!(:dish) {chef.dishes.create!(name: "Macaroni and Cheese", description: "cheese and pasta", ingredients: [ingredient_1, ingredient_2, ingredient_3])}

  before(:each) {visit chef_path(chef)}

  describe 'displays' do
    it "the chef's name" do
      expect(page).to have_content(chef.name)
    end

    it "a link to view a list of all ingredients they use" do
      expect(page).to have_link("Ingredients", href: chef_ingredients_path(chef))
    end
  end
end
