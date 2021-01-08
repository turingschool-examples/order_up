require 'rails_helper'

describe "when I visit a chef's show page" do
  before :each do
    @chef_1 = Chef.create!(name: "Bob")

    @dish_1 = Dish.create!(name: "Gouda Burger", description: "Delicious goodness", chef_id: "#{@chef_1.id}")
    @dish_2 = Dish.create!(name: "Hit Me With Your Best Shallot Burger", description: "Delicious puns", chef_id: "#{@chef_1.id}")

    @ingr_1 = Ingredient.create!(name: "beef patty", calories: 800)
    @ingr_2 = Ingredient.create!(name: "gouda cheese", calories: 300)
    @ingr_3 = Ingredient.create!(name: "onion", calories: 50)
    @ingr_4 = Ingredient.create!(name: "bun", calories: 200)
    @ingr_5 = Ingredient.create!(name: "shallots", calories: 50)
    @ingr_6 = Ingredient.create!(name: "chedder", calories: 250)

    @dish_1.ingredients << @ingr_1
    @dish_1.ingredients << @ingr_2
    @dish_1.ingredients << @ingr_3
    @dish_1.ingredients << @ingr_4

    @dish_2.ingredients << @ingr_1
    @dish_2.ingredients << @ingr_4
    @dish_2.ingredients << @ingr_5
    @dish_2.ingredients << @ingr_6
  end
  it "can see the name of that chef" do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
  end
  # it "can click a link to view a list of all ingredients they use on a chef's ingredient index page" do
  #
  # end
end
