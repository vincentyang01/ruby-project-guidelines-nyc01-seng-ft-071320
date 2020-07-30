class Trainer < ActiveRecord::Base
    has_many :instances
    has_many :pokemon_species, through: :instances


    #instance variable for trainer
    @trainer

    def self.login
        puts "Hello there! Welcome to the world of pokémon! My name is Oak! People call me the pokémon Prof! 
        This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. 
        Myself...I study pokémon as a profession.
        
        First, what is your name?"
        name = STDIN.gets.chomp
        trainer = Trainer.find_by(name: name) 
    end

    def addPokemonToTeam(args = {pokemon_species_id: selection.id, trainer_id: self.id, hp: selection.hp, atk: selection.atk, def: selection.def, spec_atk: selection.spec_atk, spec_def: selection.spec_def, speed: selection.speed})
        Instance.create do |t|
            t.pokemon_species_id = args[:pokemon_species_id]
            t.trainer_id = args[:trainer_id]
            t.hp = args[:hp] 
            t.atk = args[:atk]
            t.def = args[:def]
            t.spec_atk = args[:spec_atk]
            t.spec_def = args[:spec_def]
            t.speed = args[:speed]
            t.save
        end
    end
end