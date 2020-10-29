require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'relationships' do
    it { should have_many :dish_ingredients }
    it { should have_many(:dishes).through(:dish_ingredients) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
  end

  describe 'instance methods' do
    xit '#unique_ingredients' do
      @murray = Chef.create!(name: 'Murray McMasterful')
      @spaghetti = @murray.dishes.create!(name: 'Spaghetti', description: 'Delish!')
      @pasta = @spaghetti.ingredients.create!(name: 'Rigitoni', calories: 10)
      @sauce = @spaghetti.ingredients.create!(name: 'Red Sauce', calories: 50)
      @salt = @spaghetti.ingredients.create!(name: 'Salt', calories: 5)

      @chicken_madiera = @murray.dishes.create!(name: 'Chicken Madiera', description: 'Savory')
      @chicken = @chicken_madiera.ingredients.create!(name: 'Chicken', calories: 100)
      @mash = @chicken_madiera.ingredients.create!(name: 'Mash', calories: 300)
      @madiera = @chicken_madiera.ingredients.create!(name: 'madiera', calories: 200)

      all_ingredients = [@chicken, @mash, @madiera, @salt, @sauce, @pasta]
      expect(all_ingredients.unique_ingredients.count).to be(6)
    end
  end
end
