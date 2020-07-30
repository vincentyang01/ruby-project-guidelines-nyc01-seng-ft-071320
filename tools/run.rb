require 'json'
require 'pry'
require_relative '../config/environment'

# PokemonSpecies.destroy_all
Trainer.destroy_all
# Instance.destroy_all

gary = Trainer.create(name: "Gary")
#gary.instances
#gary.pokemon_species

cli = CLI.new
cli.start


i1 = Instance.create(pokemon_species_id: 1, trainer_id: 806)

# binding.pry



# Fix exit
# Fix view pokemon of trainer -> Call a class in Trainer and self.pokemon?
# 