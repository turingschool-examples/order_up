class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def unique_ingredients
    ingredients.distinct
  end
end
