class AddAdditionalTypeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_species, :type1, :string
  end
end
