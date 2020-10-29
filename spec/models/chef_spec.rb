require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    before :each do
      @chef = Chef.create!(name: "Guy Ramsey")

      @chef2 = Chef.create!(name: "Gordon Fieri")

      @dish1 = @chef.dishes.create!(name: 'Burger Bomb',
                                    description: 'An explosion of flavor!')
                                    
      @dish2 = @chef.dishes.create!(name: 'Pizza Pizzazz',
                                    description: 'Pizzapizzapizzapizza')

      @dish3 = @chef2.dishes.create!(name: 'Ravenous Ravioli',
                                    description: 'Eat it before it eats you!')

      @ingredient = @dish1.ingredients.create!(name: "Ground Beef",
                                               calories: "100")

      @ingredient2 = @dish2.ingredients.create!(name: "Cheese",
                                                calories: "50")
      @ingredient3 = @dish3.ingredients.create!(name: "Marinara Sauce",
                                                calories: "40")

      @dish3.ingredients << @ingredient2
      @dish1.ingredients << @ingredient2
    end

    it '.chefs_ingredients' do
      expect(@chef.chefs_ingredients).to eq([@ingredient, @ingredient2])
    end
  end
end
