require 'rails_helper'

describe 'As a Visitor' do
  describe 'when I visit a dishes show page' do
    before :each do
      @chef = Chef.create!(name: "Gordon Boyardee")

      @dish = Dish.create!(name: "Spaghetti and Meatballs",
                           description: "I mean it's in the name yo",
                           chef_id: @chef.id)
    end

    it 'I see the dish name and description' do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
    end
  end
end
