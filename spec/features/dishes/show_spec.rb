require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'when i visit a show page' do
    it 'can display that dish name & description' do
      @chef = Chef.create!(name: "Bob")
      @curry = @chef.dishes.create!(name: "Curry", description: "Flavor!")
      visit chef_dish_path(@chef, @curry)

      within "#dish-#{@curry.id}" do
        expect(page).to have_content("Name: #{@curry.name}")
        expect(page).to have_content("About this dish: #{@curry.description}")
      end

    end
  end
end
