class Meal < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end
