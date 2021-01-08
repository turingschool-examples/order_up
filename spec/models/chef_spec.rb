require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "all_ingredients" do
    before do
      @chef = Chef.create!(name: "Chef Aiden")
      @chicken_alfredo = @chef.dishes.create!(name: "Chicken Alfredo", description: "It's alfredo-y!")
      @chicken = @chicken_alfredo.ingredients.create!(name: "chicken", calories: 400)
      @alfredo_sauce = @chicken_alfredo.ingredients.create!(name: "alfredo sauce", calories: 750)
      @pecan_salad = @chef.dishes.create!(name: "Salad", description: "It's green!")
      @lettuce = @pecan_salad.ingredients.create!(name: "lettuce", calories: 20)
      @pecan = @pecan_salad.ingredients.create!(name: "pecans", calories: 120)
      @salmon_fillet = Ingredient.create!(name: "salmon_fillet", calories: 650) 
    end
    
    it "should return an array of ingredient names used by a particular chef" do
      results = @chef.all_ingredients

      expect(results).to eq([@chicken.name, @alfredo_sauce.name, @lettuce.name, @pecan.name])
      expect(results).not_to include(@salmon_fillet.name)
    end
    

  end
end
