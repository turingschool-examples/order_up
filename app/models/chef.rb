class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    dishes.select("ingredients.name")
          .joins(:ingredients)
          .pluck("ingredients.name")
          .uniq
  end
end
