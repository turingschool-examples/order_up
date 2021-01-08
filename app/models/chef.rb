class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    Ingredient.joins(:dishes).where(dishes: {chef_id: id}).pluck(:name)
  end
end
