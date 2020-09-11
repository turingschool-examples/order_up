require 'rails_helper'

describe 'Dish Show Page' do
  it 'can dish info including ingredients and chef' do
    chef1 = Chef.create(name: 'Chef Un')

    pasta = Dish.create(name: 'La pasta', description:'La best pasta', chef: chef1)
    lasagna = Dish.create(name: 'La lasagna', description:'La best lasagna', chef: chef1)

    tomato_sause = Ingredient.create(name: 'tomato sause', calories: 10)
    meat_balls = Ingredient.create(name: 'meat balls', calories: 100)
    salt = Ingredient.create(name: 'salt', calories: 1)
    flat_pasta = Ingredient.create(name: 'flat pasta', calories: 150)

    Recipe.create(dish: pasta, ingredient: tomato_sause)
    Recipe.create(dish: pasta, ingredient: meat_balls)
    Recipe.create(dish: pasta, ingredient: salt)

    Recipe.create(dish: lasagna, ingredient: tomato_sause)
    Recipe.create(dish: lasagna, ingredient: flat_pasta)
    Recipe.create(dish: lasagna, ingredient: salt)

    visit "/dish/#{pasta.id}"

    expect(page).to have_content(pasta.name)
    expect(page).to have_content(pasta.description)
    expect(page).to have_content(tomato_sause.name)
    expect(page).to have_content(meat_balls.name)
    expect(page).to have_content(salt.name)
    expect(page).to have_content(chef1.name)
  end
end
