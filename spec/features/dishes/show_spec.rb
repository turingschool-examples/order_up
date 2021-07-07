require 'rails_helper'

RSpec.describe 'Dish show page' do

  before :each do
    ty = Chef.create(name: "Tyler Fields")
    pizza = ty.dishes.create(name: "Pizza", description: "Yum!")
    bng = ty.dishes.create(name: "Biscuits and Gravy", description: "Yum!")
    cbb = ty.dishes.create(name: "Chicken Burrito Bowl", description: "Yum!")
    pep = pizza.ingredients.create(name: "Pepperoni", calories: 200)
    dough = pizza.ingredients.create(name: "Pizza Dough", calories: 300)
    flour = bng.ingredients.create(name: "Flour", calories: 100)
    saus = bng.ingredients.create(name: "Sausage", calories: 500)
    chik = cbb.ingredients.create(name: "Chicken", calories: 150)
    @dishes = Dish.all
  end

  it "displays list of ingredients for dish and displays chef's name" do
    @dishes.each do |dish|
      visit dish_path(dish)
      expect(page).to have_content(dish.chef.name)
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.description)
      dish.ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end
    end
  end

  it "displays calorie count for dish" do
    @dishes.each do |dish|
      visit dish_path(dish)
      expect(page).to have_content(dish.calorie_count)
    end
  end
end
