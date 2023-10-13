class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :image_url, presence: true
  validates :instruction, presence: true
end
