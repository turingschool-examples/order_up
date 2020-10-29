class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def top_3
    Dish.joins(:recipes).order(ingredients: :desc).limit(3)
  end
  
end
