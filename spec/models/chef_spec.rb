require 'rails_helper'

RSpec.describe Chef, type: :model do
  before :each do
    set_up
  end
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    describe "#all_ingredients_used" do
      it "lists the names of all ingredients use in the chef's dishes" do
        answer = [@asparagus.name, @beef.name, @noodles.name, @snap_peas.name]

        expect(@chef_a.all_ingredients_used).to eq(answer)
      end
    end
  end

  def set_up
    def set_up
      @chef_a = Chef.create!(name: "Assa Paragus")

      @dish_1 = @chef_a.dishes.create!(name: "Asparagus Stirfy", description: "Sizzly!")
      @dish_2 = @chef_a.dishes.create!(name: "Grilled Asparagus", description: "Crunchy!")
      @dish_3 = @chef_a.dishes.create!(name: "Cream of Asparagus Soup", description: "Creamy!")

      @asparagus = Ingredient.create!(name: "Asparagus", calories: 100)
      @snap_peas = Ingredient.create!(name: "Snap Peas", calories: 100)
      @noodles = Ingredient.create!(name: "Noodles", calories: 500)
      @beef = Ingredient.create!(name: "Beef", calories: 500)

      @chef_a.dishes.find(@dish_1.id).ingredients << @asparagus
      @chef_a.dishes.find(@dish_1.id).ingredients << @snap_peas
      @chef_a.dishes.find(@dish_1.id).ingredients << @noodles
      @chef_a.dishes.find(@dish_2.id).ingredients << @asparagus
      @chef_a.dishes.find(@dish_2.id).ingredients << @beef
      @chef_a.dishes.find(@dish_3.id).ingredients << @asparagus

    end
  end
end
