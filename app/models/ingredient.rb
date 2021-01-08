class Ingredient < ApplicationRecord
    validates_presence_of :name, :calories
    has_many :recipes
    has_many :dishes, through: :recipes

end