class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredients_lists
  has_many :ingredients, through: :ingredients_lists

  def creator
    Chef.where(id: self.chef_id).pluck(:name).join
  end

  def total_calories
    self.ingredients.sum(:calories)
  end
end
