require "rails_helper"

RSpec.describe "chef's show page", type: :feature do
  it "shows a chefs name and a link to the ingredients page" do
    chef_1 = Chef.create!(name: "Chef")
    dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
    dish_2 = Dish.create!(name: "Toast", description: "Yummy", chef_id: chef_1.id )
    dish_3 = Dish.create!(name: "Fried Cheese", description: "Yummy", chef_id: chef_1.id )
    ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
    ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
    ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
    ingred_4 = Ingredient.create!(name: "Bread", calories: 100)
    ingred_5 = Ingredient.create!(name: "Butter", calories: 200)
    dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
    dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
    dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)
    dish_2_ingred_4 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingred_4.id)
    dish_2_ingred_5 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingred_5.id)
    dish_3_ingred_1 = DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingred_1.id)

    visit "/chefs/#{chef_1.id}"

    expect(page).to have_content(chef_1.name)
    expect(page).to have_link("Ingredients", href: "/chefs/#{chef_1.id}/ingredients")
  end

  it "clicking the link goes to a page with the ingredients the chef uses" do
    chef_1 = Chef.create!(name: "Chef")
    dish_1 = Dish.create!(name: "Pizza", description: "Tasty", chef_id: chef_1.id )
    dish_2 = Dish.create!(name: "Toast", description: "Yummy", chef_id: chef_1.id )
    dish_3 = Dish.create!(name: "Fried Cheese", description: "Yummy", chef_id: chef_1.id )
    ingred_1 = Ingredient.create!(name: "Cheese", calories: 450)
    ingred_2 = Ingredient.create!(name: "Dough", calories: 300)
    ingred_3 = Ingredient.create!(name: "Marinara", calories: 100)
    ingred_4 = Ingredient.create!(name: "Bread", calories: 100)
    ingred_5 = Ingredient.create!(name: "Butter", calories: 200)
    dish_1_ingred_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_1.id)
    dish_1_ingred_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_2.id)
    dish_1_ingred_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingred_3.id)
    dish_2_ingred_4 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingred_4.id)
    dish_2_ingred_5 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingred_5.id)
    dish_3_ingred_1 = DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingred_1.id)

    visit "/chefs/#{chef_1.id}"

    click_link

    save_and_open_page

    expect(page).to have_current_path("/chefs/#{chef_1.id}/ingredients")
    expect(page).to have_content(ingred_1.name)
    expect(page).to have_content(ingred_2.name)
    expect(page).to have_content(ingred_3.name)
    expect(page).to have_content(ingred_4.name)
    expect(page).to have_content(ingred_5.name)
  end
end
