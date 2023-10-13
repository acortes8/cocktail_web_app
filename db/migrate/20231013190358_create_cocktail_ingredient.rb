class CreateCocktailIngredient < ActiveRecord::Migration[7.0]
  def change
    create_table :cocktail_ingredients do |t|
      t.belongs_to :cocktail
      t.belongs_to :ingredient
      t.float :quantity
      t.string :unit
      t.timestamps
    end
  end
end
