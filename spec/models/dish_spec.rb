require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'instance methods' do
    it ".total_calories" do
      susan = Chef.create(name: 'Susan Daly')
      pad_thai = Dish.create(
        name: 'Pad Thai',
        description: 'A stir-fried rice noodle dish.',
        chef_id: susan.id
      )
      eggs = Ingredient.create(name: 'Scrambled egg', calories: 100)
      noodles = Ingredient.create(name: 'Rice noodles', calories: 200)
      DishIngredient.create(dish: pad_thai, ingredient: eggs)
      DishIngredient.create(dish: pad_thai, ingredient: noodles)

      expect(pad_thai.total_calories).to eq(300)
    end
  end
end
