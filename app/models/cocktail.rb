class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients
  validates :name, presence: true
  validates :image_url, presence: true
  validates :instruction, presence: true
  validates :spirit_type, presence:true
end

class Ingredient < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :cocktails, through: :cocktail_ingredients
end

class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
end
