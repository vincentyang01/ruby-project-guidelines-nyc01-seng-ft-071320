class Trainer < ActiveRecord::Base
    has_many :instances
    has_many :pokemon_species, through: :instances

    def self.login
        puts "Hello there! Welcome to the world of pokémon! My name is Oak! People call me the pokémon Prof! 
        This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. 
        Myself...I study pokémon as a profession.
        
        First, what is your name?"
        name = STDIN.gets.chomp
        trainer = Trainer.find_by(name:name) 
    end

    def addPokemonToTeam

    end
    

end