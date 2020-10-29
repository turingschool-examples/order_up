require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a dishe's show page" do
    it "I see a dishe's name and description" do
      gordon = Chef.create({name: "Gordon Ramsey"})
      burger = Dish.create({name: "Cheese Burger", description: "Famous Burger", chef_id: gordon.id})

      visit "/dishes/#{burger.id}"

      expect(page).to have_content(burger.name)
      expect(page).to have_content(burger.description)
    end
  end
end
