require 'rails_helper'

describe 'Chef show page' do
  it 'can show chef info and a link to ingredients they use' do
    chef1 = Chef.create(name: 'Chef Un')
    chef2 = Chef.create(name: 'Chef Deux')

    pasta = Dish.create(name: 'La pasta', description:'La best pasta', chef: chef1)
    lasagna = Dish.create(name: 'La lasagna', description:'La best lasagna', chef: chef2)

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

    visit "/chefs/#{chef1.id}"

    expect(page).to have_content(chef1.name)

    click_on "All my ingredients"

    expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")

    expect(page).to have_content(tomato_sause.name)
    expect(page).to have_content(meat_balls.name)
    expect(page).to have_content(salt.name)
    expect(page).not_to have_content(flat_pasta.name)
  end
end
