class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_list
    dishes.ingredients_list
  end
end
