require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    set_up
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  describe "relationships" do
    it { should belong_to :chef}
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    describe "#calorie_count" do
      it "totals the calories in a dish based on the ingredients" do
        expect(@dish_1.calorie_count).to eq(700)
      end
    end
  end
  def set_up
    @chef_a = Chef.create!(name: "Assa Paragus")

    @dish_1 = @chef_a.dishes.create!(name: "Asparagus Stirfy", description: "Sizzly!")

    @asparagus = Ingredient.create!(name: "Asparagus", calories: 100)
    @snap_peas = Ingredient.create!(name: "Snap Peas", calories: 100)
    @noodles = Ingredient.create!(name: "Noodles", calories: 500)
    @beef = Ingredient.create!(name: "Beef", calories: 500)

    @chef_a.dishes.find(@dish_1.id).ingredients << @asparagus
    @chef_a.dishes.find(@dish_1.id).ingredients << @snap_peas
    @chef_a.dishes.find(@dish_1.id).ingredients << @noodles
  end
end
