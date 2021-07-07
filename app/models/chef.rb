class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    # self.dishes.joins(:ingredients)
  end
end
