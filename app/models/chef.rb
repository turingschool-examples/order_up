class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    # couldn't figure out an active record way to do this
    self.dishes.joins(:ingredients).where(ingredient_id: :ingredient_id)
  end
end
