
require 'json'
require 'pry'
require_relative '../config/environment'

PokemonSpecies.destroy_all


a = Trainer.new(name: "A")
a1 = Instance.new()


file = File.read("./db/pokemon.json")
data = JSON.parse(file)
data.each do |pokemon_hash|
    PokemonSpecies.create(pokemon_hash)
    # binding.pry
end

binding.pry