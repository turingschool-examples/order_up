require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "methods" do
    it "#distinct_ingredients" do
      chef = Chef.create(name: "Gordon Ramsay")
      spaghetti = chef.dishes.create(name: "Spaghetti", description: "A light, classical pasta dish with succulent tomato sauce and zesty home-made meatballs")
      stroganoff = chef.dishes.create(name: "Beef Stroganoff", description: "A beef dish guaranteed to excite any pasta lover!")
      pasta = spaghetti.ingredients.create(name: "Pasta", calories: 1200)
      basil = spaghetti.ingredients.create(name: "Basil", calories: 20)
      meatball = spaghetti.ingredients.create(name: "Meatball", calories: 600)
      tomato = spaghetti.ingredients.create(name: "Tomato", calories: 60)
      milk = stroganoff.ingredients.create(name: "Milk", calories: 50)
      beef = stroganoff.ingredients.create(name: "Ground Beef", calories: 500)
      bowtie = stroganoff.ingredients.create(name: "Bowtie Pasta", calories: 1500)
      parmesan = Ingredient.create(name: "Parmesan cheese", calories: 200)
      spaghetti.recipes.create(ingredient_id: parmesan.id)
      stroganoff.recipes.create(ingredient_id: parmesan.id)

      expect(chef.distinct_ingredients).to eq([pasta, basil, meatball, tomato, parmesan, milk, beef, bowtie])
    end
  end
end
