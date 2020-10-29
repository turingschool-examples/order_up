require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it{ should have_many :dish_ingredients}
  it{ should have_many :dishes }
end
