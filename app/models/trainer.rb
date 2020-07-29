class Trainer < ActiveRecord::Base
    has_many :instances
    has_many :pokemon_species, through: :instances

    def self.login
        puts "Hello there! Welcome to the world of pokémon! My name is Oak! People call me the pokémon Prof! 
        This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. 
        Myself...I study pokémon as a profession.
        
        First, what is your name?"
        name = STDIN.gets.chomp
        Trainer.create(name: name)
        trainer = Trainer.find_by(name: name)
    end

    def addPokemonToTeam(selection) #=> Bulbasaur - the string that the user entered
        puts "made it"
        pokemon = PokemonSpecies.find_by(name: selection)
        puts "found it"
        Instance.create(pokemon_species_id: pokemon.id, trainer_id: self.id, hp: pokemon.hp, atk: pokemon.attack, 
        def: pokemon.defense, spec_atk: pokemon.spec_atk, spec_def: pokemon.spec_def, speed: pokemon.speed)
        # binding.pry

    end
    

end