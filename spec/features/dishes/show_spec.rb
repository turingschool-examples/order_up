require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do
    @chef1 = Chef.create(name: "Chef Jen")
    @dish1 = @chef1.dishes.create(name: "Fudge Cake", description: "Floating Chocolate")
    visit "/chefs/#{@chef1.id}/dishes/#{@dish1.id}"
  end

  it "has dish's name and description" do
    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
  end

  it "has dish's ingredients" do
    expect(page).to have_content(@dish1.ingredients)
  end

  it "has chef's name" do
    expect(page).to have_content("Chef Jen")
  end

  it "has total calories" do
    expect(page).to have_content(@dish1.total_calories)
  end

end
