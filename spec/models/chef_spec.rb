require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:recipes).through(:dishes)}
    it {should have_many(:ingredients).through(:recipes)}
  end

  before :each do
    @bob = Chef.create!(name: "Bob")

    @dish_1 = @bob.dishes.create!(name: "Dish 1", description: "particularly delicious")
    @dish_2 = @bob.dishes.create!(name: "Dish 2", description: "xtra delicious")
    @dish_3 = @bob.dishes.create!(name: "Dish 3", description: "massive delicious")
    
    @ingredient_1 = Ingredient.create!(name: "A", calories: 20)
    @ingredient_2 = Ingredient.create!(name: "B", calories: 10)
    @ingredient_3 = Ingredient.create!(name: "C", calories: 30)
    @ingredient_4 = Ingredient.create!(name: "D", calories: 50)
    
    Recipe.create!(dish: @dish_1, ingredient: @ingredient_1, ingredient_quantity: 2)
    Recipe.create!(dish: @dish_1, ingredient: @ingredient_2, ingredient_quantity: 1)   
    Recipe.create!(dish: @dish_1, ingredient: @ingredient_3, ingredient_quantity: 3) 
              
    Recipe.create!(dish: @dish_2, ingredient: @ingredient_1, ingredient_quantity: 2)   
    
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_1, ingredient_quantity: 1)
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_2, ingredient_quantity: 1)
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_3, ingredient_quantity: 1)
    Recipe.create!(dish: @dish_3, ingredient: @ingredient_3, ingredient_quantity: 2)
  end
  
  describe 'instance methods' do
    it '#uniq_ingredients' do
      expect(@bob.uniq_ingredients).to eq([@ingredient_1, @ingredient_2, @ingredient_3])
    end
    
    it 'top_3_ingredients' do
      @dish_4 = @bob.dishes.create!(name: "Dish 4", description: "massive delicious")
      Recipe.create!(dish: @dish_4, ingredient: @ingredient_1, ingredient_quantity: 2)

      expect(@bob.top_3_ingredients).to eq([@ingredient_1, @ingredient_3, @ingredient_2])
    end
  end
end
