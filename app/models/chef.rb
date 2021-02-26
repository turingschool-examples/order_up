class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def used_ingredients
    # dishes.flat_map do |dish|
      # dish.ingredients.map do |ing|
        # ing.name
      # end
    # end

    dishes.joins(:ingredients)
      .pluck('ingredients.name')
  end
end
