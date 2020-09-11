require 'rails_helper'

RSpec.describe 'dish show page', type: :feature do
  before :each do
    @chef_1 = Chef.create(name: "Angelica")
    @chef_2 = Chef.create(name: "Big Freedia")
    @dish_1 = Dish.create(name: "Warm Bread",
                          description: "It's just, like, kinda warm bread",
                          chef_id: @chef_1.id)
    @dish_2 = Dish.create(name: "Hot and Spicy Chicken",
                          description: "Pretty good, very bouncy",
                          chef_id: @chef_2.id)
    visit "/dishes/#{@dish_1.id}"
  end

  it 'can see all dish attributes' do
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@dish_1.chef_id)
    expect(page).to_not have_content(@dish_2.chef_id)


  end
end
