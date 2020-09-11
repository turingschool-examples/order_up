require 'rails_helper'

RSpec.describe 'Chefs' do
  it 'can show the chefs name and link for a unique list of all their ingredients they use' do
    @chef = Chef.create!(name: 'Lasondra')
    @dish_1 = @chef.dishes.create!(name: 'Meatballs', description: 'Beef in Marinera')

    @ingredient_1 = @dish_1.ingredients.create!(name: "Beef", calories: 200)
    @ingredient_2 = @dish_1.ingredients.create!(name: 'Marinera', calories: 150)
###################
    @dish_2 = @chef.dishes.create!(name: 'Mac and Cheese', description: 'Cheese and Mac')

    @ingredient_3 = @dish_2.ingredients.create!(name: "Mac", calories: 150)
    @ingredient_4 = @dish_2.ingredients.create!(name: 'Cheese', calories: 400)
    ##################
    @dish_3 = @chef.dishes.create!(name: 'Cheese Sauce', description: 'For nachos')
    @ingredient_5 = @dish_3.ingredients.create!(name: 'Cheese', calories: 400)

    visit "/chefs/#{@chef.id}"
    expect(page).to have_content("#{@chef.name}")
    expect(page).to have_link('All Ingredients Used by Chef')

    click_link 'All Ingredients Used by Chef'
    expect(page).to have_current_path "/chefs/#{@chef.id}/ingredients"

    expect(page).to have_content("#{@chef.name}")
    expect(page).to have_content("Uses the following ingredients")
    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to have_content("#{@ingredient_2.name}")
    expect(page).to have_content("#{@ingredient_3.name}")
    expect(page).to have_content("#{@ingredient_4.name}")




    # expect(page).to have_content
  end

end
