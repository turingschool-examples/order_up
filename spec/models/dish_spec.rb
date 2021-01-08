require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredients}
  end
  describe 'methods' do 
    it "knows the number of calories count per dish" do 
    ramsey = Chef.create!(name: "Gordon Ramsey")
    remy = Chef.create!(name: "Remy Gusteau")
    linguini = Chef.create!(name: "Alfredo Linguini")

    pizza = Dish.create!(name: "Supreme", description: "great food", chef_id: ramsey.id )
    pbj = Dish.create!(name: "Peanutbutter and Jelly Sandwich", description: "simple and delicious", chef_id: remy.id)
    blt = Dish.create!(name: "BLT Sandwich", description: "tasty and delicious", chef_id: remy.id)
    tamales = Dish.create!(name: "Tamales", description: "Comes in various flavors", chef_id: linguini.id)

    ingredient1 = pizza.ingredients.create!(name: "tomato sauce", calories: 45)
    ingredient2 = pbj.ingredients.create!(name: "penut butter", calories: 60)
    ingredient3 = tamales.ingredients.create!(name: "chili sauce", calories: 10)
    ingredient4 = tamales.ingredients.create!(name: "dough" , calories: 75)
    ingredient5 = pbj.ingredients.create!(name: "bread" , calories: 27)

    expect(tamales.calories_count).to eq(85)
    expect(pbj.calories_count).to eq(87)
    expect(pizza.calories_count).to eq(45)
    end
  end
end
