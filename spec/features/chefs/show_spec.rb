require 'rails_helper'

RSpec.describe 'chef show page', type: :feature do
  describe "As a visitor on the chef show page" do
    before (:each) do
      @chef = Chef.create!(name: 'Ed')

      @lentils = Ingredient.create!(name: 'Lentils', calories: 150)
      @potatoes = Ingredient.create!(name: 'Potatoes', calories: 100)
      @bun = Ingredient.create!(name: 'Bun', calories: 50)
      @patty = Ingredient.create!(name: 'Veggie Patty', calories: 100)
      @tomato = Ingredient.create!(name: 'Tomato', calories: 10)

      @soup = Dish.create!(name: 'Soup', description: 'Nice and hearty', chef: @chef)
      @soup.ingredients << @lentils
      @soup.ingredients << @potatoes

      @veggie_burger = Dish.create!(name: 'Veggie Burger', description: 'Also nice and hearty', chef: @chef)
      @veggie_burger.ingredients << @bun
      @veggie_burger.ingredients << @patty
      @veggie_burger.ingredients << @tomato
      @veggie_burger.ingredients << @potatoes

      @dal = Dish.create!(name: 'Dal', description: 'Warm and hearty', chef: @chef)
      @dal.ingredients << @lentils
      @dal.ingredients << @potatoes
      @dal.ingredients << @tomato
    end

    it "I see the chef name and link to ingredients" do
      visit "chefs/#{@chef.id}"

      expect(page).to have_content(@chef.name)
      expect(page).to have_link("View all ingredients")

      click_link("View all ingredients")

      expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")
      within '.ingredients' do
        expect(page.all('li')[0]).to have_content(@lentils.name)
        expect(page.all('li')[1]).to have_content(@potatoes.name)
        expect(page.all('li')[2]).to have_content(@bun.name)
        expect(page.all('li')[3]).to have_content(@patty.name)
        expect(page.all('li')[4]).to have_content(@tomato.name)
      end
    end

    it "I see the three most popular ingredients" do
      visit "chefs/#{@chef.id}"
      save_and_open_page
      within '.popular-ingredients' do
        expect(page.all('li')[0]).to have_content(@potatoes.name)
        expect(page.all('li')[1]).to have_content(@lentils.name)
        expect(page.all('li')[2]).to have_content(@tomato.name)
      end
    end
  end
end
