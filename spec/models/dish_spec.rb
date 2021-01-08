require 'rails_helper'

describe Dish do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end
  
  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    describe '#calorie_count' do
      it 'should sum the calories of all ingredients for a dish' do
        @c1 = Chef.create(name: 'Isabelle')
        @d1 = @c1.dishes.create(name: 'Ramen', description: 'Yum Yum Noods')
    
        @i1 = Ingredient.create!(name: 'Noodles', calories: 100)
        @i2 = Ingredient.create!(name: 'Egg', calories: 30)
        @i3 = Ingredient.create!(name: 'Green Onions', calories: 8)
        @i4 = Ingredient.create!(name: 'Enoki', calories: 18)
    
        DishIngredient.create!(dish: @d1, ingredient: @i1)
        DishIngredient.create!(dish: @d1, ingredient: @i2)
        DishIngredient.create!(dish: @d1, ingredient: @i3)
        DishIngredient.create!(dish: @d1, ingredient: @i4)
        
        expect(@d1.calorie_count).to eq(156)
      end
    end
  end
end
