class CLI

    
    def start
        trainer = Trainer.login
        self.menu
    end
    def menu
        elementArray = ["grass", "poison", "fire", "flying", "water", "bug", "normal", "electric", "ground", "fighting", "psychic", "rock", "ghost", "dragon", "Ice"]
        statsArray = ["hp", "attack", "defense", "spec_atk", "spec_def", "speed"]

        puts "Thank you for using the Pokemon simulator. 
        Please type in the name of a Pokemonn to add it to your team.
        Please see the below options if you need to sift through all of the options.
        Enter 'all' to list all Pokemon.
        Enter 'elements' to list all elements.
        Enter 'stats' to list all Pokemon stat types.
        Enter 'water' to list all Pokemon of that element.
        Enter a stat to create a conditional."


        selection = STDIN.gets.chomp
        if selection == "all"
            allPokemon
        elsif selection == "elements"
            elementArray.sort
        elsif selection == "stats"  
            statsArray
        elsif elementArray.include?(selection)
            puts "Got inside elementArray"
            pokemonWithElement(selection)
        elsif statsArray.include?(selection)
            # binding.pry
            pokemonWithStat(selection)
        elsif puts "Invalid entry. Please try again"
        end
    end

    
    def allPokemon
        names = Array.new
            PokemonSpecies.all.each do |pokemon|
                names << pokemon.name
            end
        names
    end


    def pokemonWithElement(selection)
        arr = []
        PokemonSpecies.all.select do |pokemon|
            #binding.pry
            if pokemon.element.include?(selection)
                arr << pokemon.name
            end
        end
    end

    def pokemonWithStat(stat)
        lessThanArr = []
        puts "Please enter your inequality (Ex: >40)"
        inequality = STDIN.gets.chomp
        puts "this is stat #{stat}"
        a = inequality.slice!(0)
        if a == "<" 
            if stat == "hp"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.hp < inequality.to_i
                end
            elsif stat == "attack"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.attack < inequality.to_i
                end
            elsif stat == "defense"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.defense < inequality.to_i
                end
            elsif stat == "spec_atk"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.spec_atk < inequality.to_i
                end
            elsif stat == "spec_def"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.spec_def < inequality.to_i
                end
            elsif stat == "speed"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.speed < inequality.to_i
                end
            end
        elsif a == ">"
            if stat == "hp"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.hp > inequality.to_i
                end
            elsif stat == "attack"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.attack > inequality.to_i
                end
            elsif stat == "defense"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.defense > inequality.to_i
                end
            elsif stat == "spec_atk"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.spec_atk > inequality.to_i
                end
            elsif stat == "spec_def"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.spec_def > inequality.to_i
                end
            elsif stat == "speed"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.speed > inequality.to_i
                end
            end
        elsif a == "="
            if stat == "hp"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.hp == inequality.to_i
                end
            elsif stat == "attack"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.attack == inequality.to_i
                end
            elsif stat == "defense"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.defense == inequality.to_i
                end
            elsif stat == "spec_atk"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.spec_atk == inequality.to_i
                end
            elsif stat == "spec_def"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.spec_def == inequality.to_i
                end
            elsif stat == "speed"
                PokemonSpecies.all.select do |pokemon|
                    lessThanArr << pokemon.name if pokemon.speed == inequality.to_i
                end
            end
        end
    end
end