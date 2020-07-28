class SpeciesInstance < ActiveRecord::Base
    attr_reader :pokemon_id, :trainer_id, :type, :type2, :hp, :attack, :defense, :spec_atk, :spec_def, :speed
    @@all = []
    def initalize(pokemon_id, trainer_id, type, type2 = nil, hp, attack, defense, spec_atk, spec_def, speed)
        @pokemon_id = pokemon_id
        @trainer_id = trainer_id
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

end