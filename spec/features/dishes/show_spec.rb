# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe "When I visit a dish's show page" do
    describe 'I see the dish’s name and description' do
      it "And I see a list of ingredients for that dish And I see the chef's name" do
        chef = Chef.create!(name: 'Cheif')

        dish = Dish.create!(name: 'mac and cheese', description: 'cheesy', chef_id: chef.id)

        visit "dishes/#{dish.id}"
      end
    end
  end
end
