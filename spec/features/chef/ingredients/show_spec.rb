require 'rails_helper'

describe 'Chef Ingredients Show' do
  before :each do 
    @c1 = Chef.create!(name: 'Isabelle')
    @d1 = @c1.dishes.create(name: 'Ramen', description: 'Yum Yum Noods')

    @i1 = Ingredient.create!(name: 'Noodles', calories: 100)
    @i2 = Ingredient.create!(name: 'Egg', calories: 30)
    @i3 = Ingredient.create!(name: 'Green Onions', calories: 8)
    @i4 = Ingredient.create!(name: 'Enoki', calories: 18)

    DishIngredient.create!(dish: @d1, ingredient: @i1)
    DishIngredient.create!(dish: @d1, ingredient: @i2)
    DishIngredient.create!(dish: @d1, ingredient: @i3)
    DishIngredient.create!(dish: @d1, ingredient: @i4)
    visit chef_ingredient_path(@c1)
  end

  it 'should display a list of all the ingredients that chef uses' do
    expect(page).to have_content("Ingredients that #{@c1.name} Uses")
    expect(page).to have_content(@i1.name)
    expect(page).to have_content(@i2.name)
    expect(page).to have_content(@i3.name)
    expect(page).to have_content(@i4.name)
  end
end