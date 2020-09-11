require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do 
    before :each do 
      @chef_1 = Chef.create!(name: "Dave Chang")

      @dish_1 = @chef_1.dishes.create!(name: "Chawan Mushi", description: "Steamed Japanese egg custard with mushrooms and crabmeat")
      @dish_2 = @chef_1.dishes.create!(name: "Honey-Soy-Glazed Vegetables with Crispy Mushrooms", description: "Turnips and radishes with a mix of honey and soy sauce, served with sautéed shiitake mushrooms and an ingenious, crispy rice-cracker coating.")
  
      @ingredient_1 = @dish_1.ingredients.create!(name: "Mushrooms", calories: "65")
      @ingredient_2 = @dish_1.ingredients.create!(name: "Crabmeat", calories: "82")
      @ingredient_3 = @dish_2.ingredients.create!(name: "Turnips", calories: "50")

      @dish_2.ingredients << @ingredient_1
    end

    describe ".ingredients_used" do
      it "can list unique ingredients that a chef uses in all dishes" do
        expect(@chef_1.ingredients_used).to eq([@ingredient_2.name, @ingredient_1.name, @ingredient_3.name])
      end
    end
  end
end
