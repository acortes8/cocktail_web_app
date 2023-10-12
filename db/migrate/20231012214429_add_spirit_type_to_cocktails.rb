class AddSpiritTypeToCocktails < ActiveRecord::Migration[7.0]
  def change
    add_column :cocktails, :spirit_type, :string
  end
end
