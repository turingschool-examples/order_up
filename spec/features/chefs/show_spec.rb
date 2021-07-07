require 'rails_helper'

RSpec.describe 'Dish show page' do

  before :each do
    @ty = Chef.create(name: "Tyler Fields")
    @harry = Chef.create(name: "Harry Fields")
    pizza = @ty.dishes.create(name: "Pizza", description: "Yum!")
    bng = @ty.dishes.create(name: "Biscuits and Gravy", description: "Yum!")
    cbb = @harry.dishes.create(name: "Chicken Burrito Bowl", description: "Yum!")
    pep = pizza.ingredients.create(name: "Pepperoni", calories: 200)
    dough = pizza.ingredients.create(name: "Pizza Dough", calories: 300)
    flour = bng.ingredients.create(name: "Flour", calories: 100)
    saus = bng.ingredients.create(name: "Sausage", calories: 500)
    chik = cbb.ingredients.create(name: "Chicken", calories: 150)
    @dishes = Dish.all
  end

  it 'displays name of chef, link to view ingredients that chef uses' do
    visit chef_path(@ty)
    expect(page).to have_content(@ty.name)
    expect(page).to have_link("List of Chef's Ingredients")
  end

  it "when I clink link I'm take to chef's ingredient index page and can see list of ingredients the chef uses" do
    visit chef_path(@ty)
    click_link "List of Chef's Ingredients"
    expect(current_path).to eq(chef_ingredients_path(@ty))
    @ty.dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        expect(page).to have_content(ingredient.name)
      end
    end
    expect(page).to_not have_content("Chicken")
  end
end
