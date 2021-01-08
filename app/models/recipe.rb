class Recipe < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredients
end
