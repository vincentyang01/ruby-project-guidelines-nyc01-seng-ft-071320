class Trainer < ActiveRecord::Base
    has_many :instances
    has_many :pokemon_species, through: :instances
    
    def self.login
        puts "Hello there! Welcome to the world of pokémon! My name is Oak! People call me the pokémon Prof! 
        This world is inhabited by creatures called pokémon! For some people, pokémon are pets. Others use them for fights. 
        Myself...I study pokémon as a profession.
        
        First, what is your name?"
        name = STDIN.gets.chomp.downcase
        Trainer.create(name: name)
        trainer = Trainer.find_by(name: name)
    end

    def addPokemonToTeam(selection, nickname) #=> Bulbasaur - the string that the user entered
        pokemon = PokemonSpecies.find_by(name: selection)
        num = rand(10) - 5
        Instance.create(nickname: nickname, species: pokemon_species.name, pokemon_species_id: pokemon.id, trainer_id: self.id, element: pokemon.element, hp: pokemon.hp - num, atk: pokemon.attack - num, 
        def: pokemon.defense - num, spec_atk: pokemon.spec_atk - num, spec_def: pokemon.spec_def - num, speed: pokemon.speed - num)
    end
    
    def ownedPokemon
        owned = []
        i = 0
        Instance.all.each do |pokemon|
            owned << pokemon if pokemon.trainer_id == self.id
        end    
        while i < owned.length do #map species ID to sokemon_species.name
            puts "---------------"
            puts "Pokemon Nickname: \t" + owned[i].nickname
            puts "Pokemon Species: \t" + owned[i].pokemon_species.name
            puts "Pokemon Species ID: \t" + owned[i].pokemon_species_id.to_s
            puts "Pokemon ID: \t\t" + owned[i].id.to_s
            puts "TrainerID: \t\t" + owned[i].trainer_id.to_s
            puts "HP: \t\t\t" + owned[i].hp.to_s
            puts "Attack: \t\t" + owned[i].atk.to_s
            puts "Defense: \t\t" + owned[i].def.to_s
            puts "Special Attack: \t" + owned[i].spec_atk.to_s
            puts "Special Defense: \t" + owned[i].spec_def.to_s
            puts "Speed: \t\t\t" + owned[i].speed.to_s
            puts "---------------"
            i += 1
        end        
    end

    def abandonPokemon(rmMon)
        puts "Inside abandon"
        pokemonObj = PokemonSpecies.find_by(name: rmMon)
        
        delet = self.instances.find_by(pokemon_species_id: pokemonObj)
        Instance.delete(delet)
    end

    def pokemonYouHaveLeft
        count = 151
        count2 = (self.instances).count
        puts count - count2
    end

    def oneVsOne(first,second) #Tashawn / Ian - Due to a missing variables in our schema, 
        firstPokemon = PokemonSpecies.find_by(name:first)
        secondPokemon = PokemonSpecies.find_by(name:second)
        firstId = firstPokemon.id
        secondId = secondPokemon.id
        # firstType = firstPokemon.element
        # secondType = secondPokemon.element
        firstPokemon = self.instances.find_by(pokemon_species_id: firstId)
        secondPokemon = self.instances.find_by(pokemon_species_id: secondId)

        #calculations
        if firstPokemon.hp > secondPokemon.hp
            topHealth = first else topHealth = second
        end
        
        if firstPokemon.atk > secondPokemon.atk
            topattack= first else topattack = second
        end
        
        if firstPokemon.def > secondPokemon.def 
            topdef = first else topdef = second
        end

        if firstPokemon.spec_atk > secondPokemon.spec_atk 
            topspecatk = first else topspecatk = second
        end
        
        if firstPokemon.spec_def > secondPokemon.spec_def 
            topspecdef = first else topspecdef = second
        end

        if firstPokemon.speed > secondPokemon.speed 
            topspeed = first else topspeed = second
        end
        

        #############
        puts "
        -----------------------------
        Pokemon Name: \t\t\t #{first} \t #{second}           
        Element: \t\t\t #{firstPokemon.element} \t #{secondPokemon.element}
        Health: \t\t\t #{firstPokemon.hp} \t\t #{secondPokemon.hp}
        Attack: \t\t\t #{firstPokemon.atk} \t\t #{secondPokemon.atk}
        Defense: \t\t\t #{firstPokemon.def} \t\t #{secondPokemon.def}
        Special Attack: \t\t #{firstPokemon.spec_atk} \t\t #{secondPokemon.spec_atk}
        Special Defense: \t\t #{firstPokemon.spec_def} \t\t #{secondPokemon.spec_def}
        Speed: \t\t\t\t #{firstPokemon.speed} \t\t #{secondPokemon.speed}
        ----------------------------
        - #{topHealth} can take more of a hit with it's larger health pool.
        
        - *Poke*Poke*Stab*Tackle* #{topattack} can beat you with a stick harder than the other guy.
        
        - #{topdef} will have the stronger defense.

        - #{topspecatk} goes *Pew*Pew*Pew*. SAY HELLO TO MY LITTLE FRIEND!
        
        - The #{topspecdef} will win according to Special Defense stats. 

        - The first attack will go to #{topspeed}."
        
        
        

         binding.pry
    end
end