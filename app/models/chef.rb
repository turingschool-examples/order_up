class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def self.list_unique_ingredients_used
    
  end
end
