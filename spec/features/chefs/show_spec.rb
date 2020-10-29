require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit a chefs show page' do
    before :each do
      @chef    = Chef.create!(name: "Gordon Ramsay")
      @dish    = Dish.create!(name: "Avocado and Egg Toast",
                          description: "Smashed avocado toast with hardboiled eggs.",
                          chef_id: @chef.id)
      @avocado = Ingredient.create!(name: "Avocado",
                                calories: 120)
      @bread   = Ingredient.create!(name: "White Bread",
                                calories: 150)
      @egg     = Ingredient.create!(name: "Hardboiled Egg",
                                calories: 90)
  @dish_ing_1  = DishIngredient.create!(dish_id: @dish.id,
                                    ingredient_id: @avocado.id)
  @dish_ing_2  = DishIngredient.create!(dish_id: @dish.id,
                                    ingredient_id: @bread.id)
  @dish_ing_3  = DishIngredient.create!(dish_id: @dish.id,
                                    ingredient_id: @egg.id)
      @dish_2  = Dish.create!(name: "Avocado and Egg Toast",
                          description: "Smashed avocado toast with hardboiled eggs.",
                          chef_id: @chef.id)
      @pb      = Ingredient.create!(name: "Peanut Butter",
                                calories: 80)
      @jelly   = Ingredient.create!(name: "Grape Jelly",
                                calories: 220)
      @bread   = Ingredient.create!(name: "White Bread",
                                calories: 150)
    @dish_ing_4  = DishIngredient.create!(dish_id: @dish_2.id,
                                    ingredient_id: @pb.id)
    @dish_ing_5  = DishIngredient.create!(dish_id: @dish_2.id,
                                    ingredient_id: @jelly.id)
    @dish_ing_6  = DishIngredient.create!(dish_id: @dish_2.id,
                                    ingredient_id: @bread.id)

    end

    it 'has the name of the chef with a link to the chefs ingredient index' do
        visit "chefs/#{@chef.id}"

        within ".chef-details-#{@chef.id}" do
          expect(page).to have_content(@chef.name)
          expect(page).to have_link("All Ingredients")
        end
    end

    it 'the all ingredients link takes me to ingredient index with unique list of names' do
        visit "chefs/#{@chef.id}"

        within ".chef-details-#{@chef.id}" do
          click_link("All Ingredients")
        end

        expect(current_path).to eq("/chefs/#{@chef.id}/ingredients")

        within ".ingredient-list" do
          expect(page).to have_content(@avocado.name)
          expect(page).to have_content(@egg.name)
          expect(page).to have_content(@bread.name)
          expect(page).to have_content(@pb.name)
          expect(page).to have_content(@jelly.name)
        end
    end
  end
end
