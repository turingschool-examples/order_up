require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :dishes }
    it { should have_many(:ingredients).through(:dishes) }
  end

  describe "instance methods" do
    it ".distinct_ingredients" do
      susan = Chef.create(name: 'Susan Daly')

      eggs = Ingredient.create(name: 'Scrambled egg', calories: 100)
      noodles = Ingredient.create(name: 'Rice noodles', calories: 200)
      rice = Ingredient.create(name: 'Rice', calories: 250)
      chicken = Ingredient.create(name: 'Chicken', calories: 150)
      soy_sauce = Ingredient.create(name: 'Soy sauce', calories: 50)
      carrots = Ingredient.create(name: 'Carrots', calories: 50)

      pad_thai = Dish.create(
        name: 'Pad Thai',
        description: 'A stir-fried rice noodle dish.',
        chef_id: susan.id
      )
      DishIngredient.create(dish: pad_thai, ingredient: eggs)
      DishIngredient.create(dish: pad_thai, ingredient: noodles)
      DishIngredient.create(dish: pad_thai, ingredient: chicken)
      DishIngredient.create(dish: pad_thai, ingredient: soy_sauce)

      fried_rice = Dish.create(
        name: 'Chicken Fried Rice',
        description: 'A stir-fried rice dish with eggs and carrots.',
        chef_id: susan.id
      )
      DishIngredient.create(dish: fried_rice, ingredient: soy_sauce)
      DishIngredient.create(dish: fried_rice, ingredient: eggs)
      DishIngredient.create(dish: fried_rice, ingredient: rice)
      DishIngredient.create(dish: fried_rice, ingredient: chicken)

      ingredients_list = [eggs, noodles, rice, chicken, soy_sauce]
      not_all = [eggs, noodles, rice, chicken, soy_sauce, carrots]

      expect(susan.distinct_ingredients).to eq(ingredients_list)
      expect(susan.distinct_ingredients).to_not eq(not_all)
    end
  end
end
