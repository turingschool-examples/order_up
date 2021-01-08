require "rails_helper"

describe "chef show page" do
  before :each do
    @chef = Chef.create(name: "Chef Boyardee")
    @dish = @chef.dishes.create(name: "Soup", description: "its soup")
    @ingredient1 = Ingredient.create(name: "Noodles", calories: 50)
    @ingredient2 = Ingredient.create(name: "Chicken broth", calories: 20)
    @ingredient3 = Ingredient.create(name: "Chicken", calories: 55)

    @dish2 = @chef.dishes.create(name: "Mac & Cheese", description: "its mac and cheese but theres also chicken")
    @ingredient4 = Ingredient.create(name: "Cheese", calories: 20)

    @dish3 = @chef.dishes.create(name: "Noodles with broth", description: "noodles")

    IngredientDish.create(ingredient: @ingredient1, dish: @dish, amount: 1)
    IngredientDish.create(ingredient: @ingredient2, dish: @dish, amount: 2)
    IngredientDish.create(ingredient: @ingredient3, dish: @dish, amount: 3)

    IngredientDish.create(ingredient: @ingredient1, dish: @dish2, amount: 1)
    IngredientDish.create(ingredient: @ingredient4, dish: @dish2, amount: 2)
    IngredientDish.create(ingredient: @ingredient3, dish: @dish2, amount: 3)

    IngredientDish.create(ingredient: @ingredient1, dish: @dish3, amount: 1)
    IngredientDish.create(ingredient: @ingredient2, dish: @dish3, amount: 2)
    visit "/chefs/#{@chef.id}"
  end

  it "has a link to chef ingredient index page" do
    click_on("See Used Ingredients")
    expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
  end

  it "displays the chef's top 3 ingredients" do

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
  end

end
