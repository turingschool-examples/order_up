require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    describe "#list_unique_ingredients_used" do
      it 'lists the unique ingredients used by chef' do
        taiki = Chef.create!(name: "Joseph Taiki")
        onion_soup = taiki.dishes.create!(name: "Onion Soup", description: "Homemade taste with organic and local grown ingredients. Vegetarian and Vegan options available!")
        onion = onion_soup.ingredients.create!(name: "White Onion", calories: 5)
        broth = onion_soup.ingredients.create!(name: "Hearty Veggie Broth", calories: 10)
        cheese = onion_soup.ingredients.create!(name: "Vegan Cheese", calories: 25)
        carrots = onion_soup.ingredients.create!(name: "Diced Carrots", calories: 5)

        tacos = taiki.dishes.create!(name: "Vegan Tacos", description: "Vegan options only. These delicious tacos are made with fresh tortillas, and a secret spice blend.")
        onion = tacos.ingredients.create!(name: "White Onion", calories: 5)
        avocado = tacos.ingredients.create!(name: "Avocado", calories: 20)
        cheese = tacos.ingredients.create!(name: "Vegan Cheese", calories: 25)
        lettuce = tacos.ingredients.create!(name: "Shredded Lettuce", calories: 5)
        carrots = tacos.ingredients.create!(name: "Diced Carrots", calories: 5)

        ingredients = taiki.list_unique_ingredients_used
        expect(ingredients.count).to eq(6)
      end
    end
  end
end
