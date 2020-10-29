class Recipe < ApplicationRecord
  belongs to :dish
  belongs to :ingredient
end
