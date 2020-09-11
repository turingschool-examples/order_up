require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  before :each do
    @chef_1 = Chef.create(name: "Angelica")
    @chef_2 = Chef.create(name: "Big Freedia")
    @chef_3 = Chef.create(name: "Kind Ron")
    @dish_1 = Dish.create(name: "Warm Bread",
                          description: "It's just, like, kinda warm bread with butter",
                          chef_id: @chef_3.id)
    @dish_2 = Dish.create(name: "Hot and Spicy Chicken",
                          description: "Pretty good, very bouncy",
                          chef_id: @chef_2.id)
    @ingretient_1 = Ingredient.create(name: "Bread",
                                      calories: "200")
    @ingretient_2 = Ingredient.create(name: "Chicken",
                                      calories: "100")
    @ingretient_3 = Ingredient.create(name: "Hot Peppers",
                                      calories: "400")
    @ingretient_4 = Ingredient.create(name: "Butter",
                                      calories: "300")

    visit "/dishes/#{@dish_1.id}"
  end

  it 'can see all dish attributes' do
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@chef_3.name)
    expect(page).to have_content("500")
    expect(page).to_not have_content(@dish_2.chef_id)
    expect(page).to_not have_content(@ingretient_3.name)
  end
end
