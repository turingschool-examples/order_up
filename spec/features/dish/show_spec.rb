require 'rails_helper'

RSpec.describe "dish show page" do 
  before :each do 
    @chef1 = Chef.create!(name: "mario")
    @dish1 = Dish.create!(name: "pasta", description: "italian", chef: @chef1)
    visit dish_path(@dish1.id)
  end

  it "displays dish name and description" do 
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
  end
end