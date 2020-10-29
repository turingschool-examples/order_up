require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit a dish show page' do
    before :each do
      @chef    = Chef.create!(name: "Gordon Ramsay")
      @dish    = Dish.create!(name: "Avocado and Egg Toast",
                              description: "Smashed avocado toast with hardboiled eggs.",
                              chef_id: @chef.id)
      @avocado = Ingredient.create!(name: "Avocado",
                                    calories: 120)
      @toast   = Ingredient.create!(name: "Toasted Multigrain Bread",
                                    calories: 180)
      @egg     = Ingredient.create!(name: "Hardboiled Egg",
                                    calories: 90)
  @dish_ing_1  = DishIngredient.create!(dish_id: @dish.id,
                                        ingredient_id: @avocado.id)
  @dish_ing_2  = DishIngredient.create!(dish_id: @dish.id,
                                        ingredient_id: @toast.id)
  @dish_ing_3  = DishIngredient.create!(dish_id: @dish.id,
                                        ingredient_id: @egg.id)
    end

    it 'has the dishes name, description, list of ingredients and the chefs name' do
      visit "/dishes/#{@dish.id}"

      within ".dish-details-#{@dish.id}" do
        expect(page).to have_content(@dish.name)
        expect(page).to have_content(@dish.description)
      end

      within ".ingredient-list" do
        expect(page).to have_content(@avocado.name)
        expect(page).to have_content(@toast.name)
        expect(page).to have_content(@egg.name)
      end

      within ".chef-details-#{@chef.id}" do
        expect(page).to have_content(@chef.name)
      end
    end

    it 'has a total calorie count for that dish' do
      visit "/dishes/#{@dish.id}"

      within ".dish-details-#{@dish.id}" do
        expect(page).to have_content(@dish.total_calories)
      end
    end
  end
end
