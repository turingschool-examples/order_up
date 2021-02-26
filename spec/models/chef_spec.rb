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
      @gus = Chef.create!( name: 'Gusteau' )
      @dish1 = @gus.dishes.create!( name: 'Clam Spaghetti', description: 'spicy seafood pasta' )
      @dish2 = @gus.dishes.create!( name: 'Bingo Soup', description: 'creative and colorful' )

      @clam = Ingredient.create!( name: 'clams', calories: 200 )
      @spag = Ingredient.create!( name: 'thin spaghetti', calories: 400 )

      @fish = Ingredient.create!( name: 'smoked fish', calories: 150)
      @rice = Ingredient.create!( name: 'omni-rice', calories: 5511)
      @clam2 = Ingredient.create!( name: 'clams', calories: 200 )

      @dish1.ingredients << [@clam, @spag]
      @dish2.ingredients << [@fish, @rice, @clam2]
    end
    describe '#used_ingredients' do
      it 'returns a collection of all used ingredients' do
        expect(@gus.used_ingredients).to eq(['clams', 'thin spaghetti', 'smoked fish', 'omni-rice', 'clams'])
      end
    end
  end
end
