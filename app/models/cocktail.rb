class Cocktail < ApplicationRecord
  has_many :cocktail_ingredients
  has_many :ingredients, through: :cocktail_ingredients

  validates :name, presence: true
  validates :image_url, presence: true
  validates :instruction, presence: true
  validates :spirit_type, presence: true

  accepts_nested_attributes_for :cocktail_ingredients, allow_destroy: true

  before_save :find_or_create_ingredients

  def find_or_create_ingredients
    self.cocktail_ingredients.each do |cocktail_ingredient|
      cocktail_ingredient.ingredient = Ingredient.find_or_create_by(name:cocktail_ingredient.ingredient.name)
    end
  end
end
