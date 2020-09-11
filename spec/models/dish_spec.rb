require 'rails_helper'

RSpec.describe Dish do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
  end

  describe 'instance methods' do
    it 'total_calories' do
      chef_ryan = Chef.create!(
        name: 'Ryan'
      )
      @dish = chef_ryan.dishes.create!(
        name: 'Test dish',
        description: 'Test description'
      )
      @dish.ingredients.create!(
        name: 'Pizza',
        calories: 500
      )
      @dish.ingredients.create!(
        name: 'Salad',
        calories: 200
      )

      expect(@dish.total_calories).to eq(700)
    end
  end
end
