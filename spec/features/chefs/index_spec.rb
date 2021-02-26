require 'rails_helper'

RSpec.describe 'Chef Index Page' do
  before :each do
    @chef1 = Chef.create(name: "Chef Jen")
    @dish1 = @chef1.dishes.create(name: "Fudge Cake", description: "Floating Chocolate")
    @chocolate = Ingredient.create(name: "chocolate", calories: 50.00)
    @fudge = Ingredient.create(name: "fudge", calories: 70.00)
    DishIngredient.create(dish: @dish1, ingredient: @chocolate)
    DishIngredient.create(dish: @dish1, ingredient: @fudge)

    @chef2 = Chef.create(name: "Chef Khoa")
    @dish2 = @chef2.dishes.create(name: "Durian Cake", description: "Durain Exquisite")
    @durian = Ingredient.create(name: "durian", calories: 45.00)
    @white_chocolate = Ingredient.create(name: "white chocolate", calories: 70.00)
    DishIngredient.create(dish: @dish2, ingredient: @durian)
    DishIngredient.create(dish: @dish2, ingredient: @white_chocolate)
    visit "/chefs"
  end

  it "has name" do
    expect(page).to have_content(@chef1.name)
  end

end
