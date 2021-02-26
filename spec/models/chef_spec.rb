require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "#find_unique_ingredients" do
      @gordon = Chef.create!(
        name: "Gordon Ramsey"
      )
      @penne = @gordon.dishes.create!(
        name: "Penne Vodka",
        description: "Saucy"
      )
      @wellington = @gordon.dishes.create!(
        name: "Beef Wellington",
        description: "Bloody Brilliant"
      )
      @risotto = @gordon.dishes.create!(
        name: "Seafood Risotto",
        description: "Also Bloody Brilliant"
      )
      @beef = Ingredient.create!(
        name: "Dont forget the lamb sauce",
        calories: 1000
      )
      @puff_pastry = Ingredient.create!(
        name: "Puff Pastry",
        calories: 800
      )
      @noodles = Ingredient.create!(
        name: "Penne",
        calories: 300
      )
      @sauce = Ingredient.create!(
        name: "Sauce",
        calories: 800
      )
      @parm = Ingredient.create!(
        name: "Cheese",
        calories: 400
      )
      @salmon = Ingredient.create!(
        name: "Salmon",
        calories: 500
      )
      @wellington.ingredients << [@parm, @puff_pastry]
      @penne.ingredients << [@parm,]
      @risotto.ingredients << [@parm, @noodles]

      expected = @gordon.find_unique_ingredients

      expect(expected[2].name).to eq(@parm.name)
      expect(expected[0].name).to eq(@puff_pastry.name)
      expect(expected[1].name).to eq(@noodles.name)
    end

    it "#most_popular_ingredients" do
        @gordon = Chef.create!(
          name: "Gordon Ramsey"
        )
        @penne = @gordon.dishes.create!(
          name: "Penne Vodka",
          description: "Saucy"
        )
        @wellington = @gordon.dishes.create!(
          name: "Beef Wellington",
          description: "Bloody Brilliant"
        )
        @risotto = @gordon.dishes.create!(
          name: "Seafood Risotto",
          description: "Also Bloody Brilliant"
        )
        @beef = Ingredient.create!(
          name: "Dont forget the lamb sauce",
          calories: 1000
        )
        @puff_pastry = Ingredient.create!(
          name: "Puff Pastry",
          calories: 800
        )
        @noodles = Ingredient.create!(
          name: "Penne",
          calories: 300
        )
        @sauce = Ingredient.create!(
          name: "Sauce",
          calories: 800
        )
        @parm = Ingredient.create!(
          name: "Cheese",
          calories: 400
        )
        @salmon = Ingredient.create!(
          name: "Salmon",
          calories: 500
        )
        @wellington.ingredients << [@beef, @puff_pastry]
        @penne.ingredients << [@beef, @noodles]
        @risotto.ingredients << [@beef, @noodles]

        expected = @gordon.most_popular_ingredients

        expect(expected[0].name).to eq(@beef.name)
        expect(expected[1].name).to eq(@noodles.name)
        expect(expected[2].name).to eq(@puff_pastry.name)
    end
  end
end
