require 'rails_helper'

RSpec.describe Dish, type: :model do
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
    before :each do
      @chef1 = Chef.create!(name: 'gerald')

      @dish1 = Dish.create!(name: 'cheese',
                            description: 'its cheese',
                            chef_id: @chef1.id)

      @ingredient1 = Ingredient.create!(name: 'milk',
                                        calories: 4)

      @ingredient2 = Ingredient.create!(name: 'other cheese stuff',
                                        calories: 6)

      @ingredient3 = Ingredient.create!(name: 'more cheese stuff',
                                        calories: 8)

      @dish1.ingredients << @ingredient1
      @dish1.ingredients << @ingredient2
      @dish1.ingredients << @ingredient3
    end
    it '#total_calories' do
      expect(@dish1.total_calories).to eq(18)
    end
  end
end
