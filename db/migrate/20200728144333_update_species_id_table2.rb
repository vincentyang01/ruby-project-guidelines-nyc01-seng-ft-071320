class UpdateSpeciesIdTable2 < ActiveRecord::Migration[6.0]
  def change
    change_column :instances, :pokemon_species, :integer
  end
end
