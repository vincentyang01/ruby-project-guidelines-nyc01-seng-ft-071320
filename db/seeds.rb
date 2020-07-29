
require 'json'
require 'pry'
require_relative '../config/environment'

PokemonSpecies.destroy_all
Trainer.destroy_all


a = Trainer.create(name: "A")
a1 = Instance.create()


file = File.read("./db/pokemon.json")
data = JSON.parse(file)
data.each do |pokemon_hash|
    PokemonSpecies.create(pokemon_hash)
end
cli = CLI.new
binding.pry
cli.start

binding.pry