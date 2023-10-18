class CocktailIngredient < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  accepts_nested_attributes_for :ingredient
end
