require 'rails_helper'

describe 'Chefs Show Page' do
  before :each do 
    @c1 = Chef.create!(name: 'Isabelle')
    @c1 = Chef.create(name: 'Isabelle')

    @d1 = @c1.dishes.create(name: 'Ramen', description: 'Yum Yum Noods')
    @d2 = @c1.dishes.create(name: 'Sukiyaki', description: 'Grillin Fun')

    @i1 = Ingredient.create!(name: 'Noodles', calories: 100)
    @i2 = Ingredient.create!(name: 'Egg', calories: 30)
    @i3 = Ingredient.create!(name: 'Green Onions', calories: 8)
    @i4 = Ingredient.create!(name: 'Enoki', calories: 18)
    @i5 = Ingredient.create!(name: 'Tofu', calories: 47)
    @i6 = Ingredient.create!(name: 'Beef', calories: 200)
    @i7 = Ingredient.create!(name: 'Carrots', calories: 12)

    DishIngredient.create!(dish: @d1, ingredient: @i1)
    DishIngredient.create!(dish: @d1, ingredient: @i2)
    DishIngredient.create!(dish: @d1, ingredient: @i3)
    DishIngredient.create!(dish: @d1, ingredient: @i4)

    DishIngredient.create!(dish: @d2, ingredient: @i2)
    DishIngredient.create!(dish: @d2, ingredient: @i3)
    DishIngredient.create!(dish: @d2, ingredient: @i4)
    DishIngredient.create!(dish: @d2, ingredient: @i6)
    DishIngredient.create!(dish: @d2, ingredient: @i7)
    visit chef_path(@c1)
  end

  it 'should display the chefs name' do
    expect(page).to have_content(@c1.name)
  end

  it 'should have a link to all ingredients this chef uses' do
    expect(page).to have_link("See All Ingredients #{@c1.name} Uses")
    click_link "See All Ingredients #{@c1.name} Uses"
    expect(current_path).to eq(chef_ingredient_path(@c1))
  end

  it 'should have their top 3 ingredients' do 
    expect(page).to have_content("Top 3 Ingredients #{@c1.name} Uses")
    expect(page).to have_content(@i2.name)
    expect(page).to have_content(@i3.name)
    expect(page).to have_content(@i4.name)
  end
end