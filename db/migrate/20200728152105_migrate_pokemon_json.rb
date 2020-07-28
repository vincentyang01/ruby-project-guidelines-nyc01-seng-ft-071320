class MigratePokemonJson < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_species do |t|
      t.string :name 
      t.string :element 
      t.integer :hp 
      t.integer :attack 
      t.integer :defense
      t.integer :spec_atk
      t.integer :spec_def
      t.integer :speed
    end
  end
end
