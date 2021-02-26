class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  
  def ingredients
    Ingredient.joins(:dishes).where('dishes.chef_id = ?', self.id)
  end
end
