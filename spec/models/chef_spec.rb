require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'instance methods' do
    describe '#unique_ingredients' do
      it 'returns unique list of ingredients for a chef' do
        ina = Chef.create!(name: "Ina Garten")
        spaghetti = ina.dishes.create!(name: "Famous Spaghetti", description: "Flavorful marinara over bed of spaghetti")
        tomatoes = spaghetti.ingredients.create!(name: "Tomatoes", calories: 100)
        spaghetti_pasta = spaghetti.ingredients.create!(name: "Spaghetti Pasta", calories: 450)
        italian_herbs = spaghetti.ingredients.create!(name: "Italian Herbs", calories: 5)
        salt = spaghetti.ingredients.create!(name: "Salt", calories: 5)
        parmesan = spaghetti.ingredients.create!(name: "parmesan", calories: 100)

        applesauce = ina.dishes.create!(name: "Cinnamon Applesauce", description: "Slightly sweetened tangy cinnamon applesauce")
        apple = applesauce.ingredients.create!(name: "Apple", calories: 85)
        cinnamon = applesauce.ingredients.create!(name: "Cinnamon", calories: 0)
        sugar = applesauce.ingredients.create!(name: "Sugar", calories: 40)
        applesauce.ingredients << salt

        results = [tomatoes, spaghetti_pasta, italian_herbs, salt, parmesan, apple, cinnamon, sugar]

        expect(ina.unique_ingredients).to eq(results)
      end
    end
  end
end
