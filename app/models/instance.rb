class Instance < ActiveRecord::Base
    belongs_to :trainer
    belongs_to :pokemon_species
    
    
end