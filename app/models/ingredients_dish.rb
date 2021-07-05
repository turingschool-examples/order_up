class IngredientsDish < ApplicationRecord

  belongs_to :ingredient
  belongs_to :dish

end
