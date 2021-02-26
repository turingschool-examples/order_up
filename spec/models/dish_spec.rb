require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end
  describe 'instance methods' do
    before :each do
      @gus = Chef.create!( name: 'Gusteau' )
      @dish1 = @gus.dishes.create!( name: 'Clam Spaghetti', description: 'spicy seafood pasta' )
      @clam = @dish1.ingredients.create!( name: 'clams', calories: 200 )
      @spag = @dish1.ingredients.create!( name: 'thin spaghetti', calories: 400 )
    end
    describe 'dish#total_cal' do
      it 'returns total calories of all ingredients' do
        expect(@dish1.total_cal).to eq(600)
      end
    end
  end
end
