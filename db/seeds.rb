require 'json'
require 'pry'
require_relative '../config/environment'


file = File.read("./db/pokemon.json")
data = JSON.parse(file)
data.each do |pokemon_hash|
    PokemonSpecies.create(pokemon_hash)
    binding.pry
end

binding.pry