class PokemonSpecies < ActiveRecord::Base
    has_many :instances
    has_many :trainers, through: :instances
end