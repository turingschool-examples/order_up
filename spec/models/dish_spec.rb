require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do 
    before :each do 
      @chef_1 = Chef.create!(name: "Dave Chang")

      @dish_1 = @chef_1.dishes.create!(name: "Chawan Mushi", description: "steamed Japanese egg custard with mushrooms and crabmeat")
  
      @ingredient_1 = @dish_1.ingredients.create!(name: "Mushrooms", calories: "65")
      @ingredient_2 = @dish_1.ingredients.create!(name: "Crabmeat", calories: "82")
    end

    describe ".ingredient_list" do
      it "can list ingredients for a dish" do
        expect(@dish_1.ingredient_list).to eq([@ingredient_1.name, @ingredient_2.name])
      end
    end

    describe ".calorie_count" do 
      it "can list total calories in a dish" do 
        expect(@dish_1.calorie_count).to eq(147)
      end 
    end
  end
end
