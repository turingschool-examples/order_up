require 'rails_helper'

describe 'Dishes Show Page' do
  before :each do
    @c1 = Chef.create(name: 'Isabelle')
    @d1 = @c1.dishes.create(name: 'Ramen', description: 'Yum Yum Noods')
    
    @i1 = Ingredient.create!(name: 'Noodles', calories: 100)
    @i2 = Ingredient.create!(name: 'Egg', calories: 30)
    @i3 = Ingredient.create!(name: 'Green Onions', calories: 8)
    @i4 = Ingredient.create!(name: 'Enoki', calories: 18)

    DishIngredient.create!(dish: @d1, ingredient: @i1)
    DishIngredient.create!(dish: @d1, ingredient: @i2)
    DishIngredient.create!(dish: @d1, ingredient: @i3)
    DishIngredient.create!(dish: @d1, ingredient: @i4)
    visit dish_path(@c1)
  end

  it 'should display the dish name and description' do
    expect(page).to have_content(@d1.name)
    expect(page).to have_content("Description: #{@d1.description}")
  end

  it 'should display a list of ingredients for dish' do
    expect(page).to have_content("Ingredients: #{@d1.ingredients}")
  end
end