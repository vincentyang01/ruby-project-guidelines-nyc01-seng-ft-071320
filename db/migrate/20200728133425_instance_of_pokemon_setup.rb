class InstanceOfPokemonSetup < ActiveRecord::Migration[6.0]
  def change
    create_table :instances do |t|
      t.string :nickname
      t.string :species
      t.string :element 
      t.integer :pokemon_species_id
      t.integer :trainer_id
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spec_atk
      t.integer :spec_def
      t.integer :speed
    end
  end
end
