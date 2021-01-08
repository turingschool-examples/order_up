require 'rails_helper'

RSpec.describe Dish, type: :model do
  before :each do
    @chef = Chef.create!(name: 'Gordon Lambsauce')
    @dish_1 = @chef.dishes.create!(name: 'Idiot Sandwich', description: 'Tasty meal consisting of two breads and an idiot')
    @ingredient_1 = Ingredient.create!(name: 'Bread Loaf', calories: 100)
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe 'instance methods' do
    it '#chef_name' do
      expect(@dish_1.chef_name).to eq(@chef.name)
    end
  end
end
