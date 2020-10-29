require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    before :each do
      @chef = Chef.create!(name: "Gordon Boyardee")

      @dish = Dish.create!(name: "Spaghetti and Meatballs",
                           description: "I mean it's in the name yo",
                           chef_id: @chef.id)

      @ingredient1 = @dish.ingredients.create!(name: "Spaghetti",
                                               calories: 100)

      @ingredient2 = @dish.ingredients.create!(name: "Meatballs",
                                               calories: 200)
    end

    it '.total_calories' do
      expect(@dish.total_calories).to eq(300)
    end
  end
end
