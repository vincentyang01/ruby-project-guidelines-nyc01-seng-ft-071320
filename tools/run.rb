require 'json'
require 'pry'
require_relative '../config/environment'

# PokemonSpecies.destroy_all
Trainer.destroy_all
# Instance.destroy_all

a = Trainer.create(name: "A")
b = Trainer.create(name: "B")
gary = Trainer.create(name: "Gary")
#gary.instances
#gary.pokemon_species

cli = CLI.new
# binding.pry
cli.start



# 