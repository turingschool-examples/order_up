require 'rails_helper'

describe DishIngredient, type: :model do
  describe 'relationships' do
    it do
      should belong_to :dish
      should belong_to :ingredient
    end
  end
end
