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

      @clam = @dish1.ingredients.create!( name: 'clams', calories: 200 )
      @spag = @dish1.ingredients.create!( name: 'thin spaghetti', calories: 400 )

      @fish = @dish2.ingredients.create!( name: 'smoked fish', calories: 150)
      @rice = @dish2.ingredients.create!( name: 'omni-rice', calories: 5511)
      @clam2 = @dish2.ingredients.create!( name: 'clams', calories: 200 )
    end
    describe '#used_ings' do
      it 'returns a collection of all used ingredients' do
        expect(@gus.used_ings).to eq(['clams', 'thin spaghetti', 'smoked fish', 'omni-rice', 'clams'])
      end
    end
  end
end
