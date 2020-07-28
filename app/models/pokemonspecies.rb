class PokemonSpecies < ActiveRecord::Base
    attr_reader :name, :type, :type2, :hp, :attack, :defense, :spec_atk, :spec_def, :speed
    @@all = []
    def initalize(name, type, type2 = nil, hp, attack, defense, spec_atk, spec_def, speed)
        @name = name
        @type = type
        @type2 = type2
        @hp = hp
        @attack = attack
        @defense = defense
        @spec_atk = spec_atk
        @spec_def = spec_def
        @speed = speed
    end
    def self.all
        @@all
    end

    #Make a t
        
end