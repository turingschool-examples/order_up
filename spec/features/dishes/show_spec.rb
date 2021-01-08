require "rails_helper"

describe "dish show page" do
  before :each do
    @chef = Chef.create(name: "Chef Boyardee")
    @dish = @chef.dishes.create(name: "Soup", description: "its soup")
    @ingredient1 = Ingredient.create(name: "Noodles", calories: 50)
    @ingredient2 = Ingredient.create(name: "Chicken broth", calories: 20)
    @ingredient3 = Ingredient.create(name: "Chicken", calories: 55)

    IngredientDish.create(ingredient: @ingredient1, dish: @dish, amount: 1)
    IngredientDish.create(ingredient: @ingredient2, dish: @dish, amount: 2)
    IngredientDish.create(ingredient: @ingredient3, dish: @dish, amount: 3)

    visit "/dishes/#{@dish.id}"
  end

  it "has dish attributes" do
    within("#dish-info") do
      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
      expect(page).to have_content(@dish.calorie_count)
    end
  end

  it "has a list of ingredients by name" do
    within("#ingredient-list") do
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
    end
  end

  it "has the chef's name" do
    within("#chef-name") do
      expect(page).to have_content(@chef.name)
    end
  end

end
