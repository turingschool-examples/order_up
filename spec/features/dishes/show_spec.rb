require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do
    @chef1 = Chef.create(name: "Chef Jen")
    @dish1 = @chef1.dishes.create(name: "Fudge Cake", description: "Floating Chocolate")
    @chocolate = Ingredient.create(name: "chocolate", calories: 50.00)
    @fudge = Ingredient.create(name: "fudge", calories: 70.00)
    DishIngredient.create(dish: @dish1, ingredient: @chocolate)
    DishIngredient.create(dish: @dish1, ingredient: @fudge)
    visit "/chefs/#{@chef1.id}/dishes/#{@dish1.id}"
  end

  it "has dish's name and description" do
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
  end

  it "has dish's ingredients" do
    expect(page).to have_content(@chocolate.name)
    expect(page).to have_content(@fudge.name)
  end

  it "has chef's name" do
    expect(page).to have_content(@dish1.chef.name)
  end

  it "has total calories" do
    expect(page).to have_content(@dish1.total_calories)
  end

  it "can remove ingredient" do
    within "#ingredient-#{@fudge.id}" do
    click_button("Remove Ingredient")
    end
  end

end
