class AddDescriptionToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :description, :text
    add_column :cocktail_ingredients, :description, :text
  end
end
