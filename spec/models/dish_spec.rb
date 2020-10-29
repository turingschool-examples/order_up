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
      @murray = Chef.create!(name: 'Murray McMasterful')
      @spaghetti = @murray.dishes.create!(name: 'Spaghetti', description: 'Delish!')
      @pasta = @spaghetti.ingredients.create!(name: 'Rigitoni', calories: 10)
      @sauce = @spaghetti.ingredients.create!(name: 'Red Sauce', calories: 50)
      @salt = @spaghetti.ingredients.create!(name: 'Salt', calories: 5)
    end

    it '#total_calories' do
      expect(@spaghetti.total_calories).to eq(65)
    end 
  end
end
