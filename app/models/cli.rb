class CLI
    def start
        trainer = Trainer.login
        menu(trainer)
    end
    def menu(trainer)
        selection = ""
        calledPokemon = []
        while trainer && selection != "exit"
            elementArray = ["grass", "poison", "fire", "flying", "water", "bug", "normal", "electric", "ground", "fighting", "psychic", "rock", "ghost", "dragon", "ice"].sort
            statsArray = ["hp", "attack", "defense", "spec_atk", "spec_def", "speed"]

            puts "
            Thank you for using the Pokedex simulator. \n\n
            Please type in the name of a Pokemonn to add it to your Pokedex.
            Enter 'view' to view the current Pokemonn in your Pokedex.
            Enter 'delete' to remove a Pokemon from your Pokedex.

            Please see the below options if you need to sift through all of the options.
            Enter 'all' to list all Pokemon in the region.
            Enter 'elements' to list all elements of Pokemon in the region.
            Enter 'stats' to list all Pokemon stat types of Pokemon in the region.
            Enter an element, such as 'water', to list all Pokemon with that element.
            Enter 'remaining pokemon' to see how many Pokemon you have to catch.
            Enter a stat to create a conditional.
            Enter 'battle' to compare two of your Pokemon.
            
            Enter 'exit' to quit."


            selection = STDIN.gets.chomp
            if selection == "all"
                allPokemon
            elsif selection == "elements"
                puts "---------------"
                puts elementArray
                puts "---------------"

            elsif selection == "remaining pokemon"
                trainer.pokemonYouHaveLeft


            elsif selection == "stats" 
                puts "---------------" 
                puts statsArray 
                puts "---------------"
            
                
            elsif elementArray.include?(selection)
                pokemonWithElement(selection)


            elsif statsArray.include?(selection)
                pokemonWithStat(selection)


            elsif allPokemonArray.include?(selection)
                if calledPokemon.include?(selection)
                    puts "
            No duplicates plz. This Pokemon was not added to the Pokedex. 
            Current List: #{calledPokemon}\n\n"
                else
                    puts "Please enter a nickname for your #{selection}"
                    nickname = STDIN.gets.cho
                    calledPokemon << selection
                    trainer.addPokemonToTeam(selection, nickname)
                    puts "
            The Pokemon, #{selection}, has been added to your Pokedex with nickname, #{nickname}.
                    "
                end



            elsif selection == "view"
                trainer.ownedPokemon



            elsif selection == "delete"
                puts "Please select the Pokemon that you would like to remove from the Pokedex.
                This is your current Pokemon in your Pokedex: #{calledPokemon}"
                rmMon = STDIN.gets.chomp # <= Holds Pikachu
                if !calledPokemon.include?(rmMon)
                    puts "This Pokemon is not among your current list of Pokemon in you Pokedex.
                    Please select a Pokemon in your Pokedex to delete: #{calledPokemon}"
                else
                    calledPokemon.delete_if{|item| item == rmMon}
                    puts "current Pokemon in Pokedex after delete: calledPokemon - #{calledPokemon}"
                    trainer.abandonPokemon(rmMon)
                    puts "Pokemon #{rmMon} has been removed from your Pokedex.
                    This is your current Pokemon in your Pokedex: #{calledPokemon}"
                end

            elsif selection == "battle"
                if calledPokemon.length < 2
                    puts "Please add additional Pokemon to your team."
                end 
                puts "Please select your first Pokemon: 
                #{calledPokemon}"
                first = STDIN.gets.chomp
                puts "Please select your second Pokemon:
                #{calledPokemon.reject{|a|a==first}}"
                second = STDIN.gets.chomp
                trainer.oneVsOne(first,second)
            elsif selection == "exit"
                exit!
            elsif puts "
                        ---------------
                Invalid entry. Please try again
                        ---------------\n"
            end
        end
    end
    
    def allPokemon
        names = Array.new
            PokemonSpecies.all.each do |pokemon|
                names << "#{pokemon.id}. \t#{pokemon.name}"
            end
        puts names
    end
    
    def allPokemonArray
        names = Array.new
        PokemonSpecies.all.each do |pokemon|
            names << pokemon.name
        end
        return names
    end

    def pokemonWithElement(selection)
        arr = []
        PokemonSpecies.all.select do |pokemon|
            if pokemon.element.include?(selection)
                arr << "#{pokemon.id}.   \t#{pokemon.name}"
                # binding.pry
            end
        end
        puts "-----------"
        puts arr
    end

    
    def pokemonWithStat(stat)
        operationArr = []
        puts "Please enter your inequality (Ex: >40 or =40)"
        inequality = STDIN.gets.chomp
        a = inequality.slice!(0)
        if a == "<" 
            if stat == "hp"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.hp < inequality.to_i
                end
                puts "-----------"
                puts operationArr

            elsif stat == "attack"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.attack < inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "defense"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.defense < inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "spec_atk"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.spec_atk < inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "spec_def"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.spec_def < inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "speed"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.speed < inequality.to_i
                end
                puts "-----------"
                puts operationArr
            end
        elsif a == ">"
            if stat == "hp"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.hp > inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "attack"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.attack > inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "defense"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.defense > inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "spec_atk"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.spec_atk > inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "spec_def"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.spec_def > inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "speed"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.speed > inequality.to_i
                end
                puts "-----------"
                puts operationArr
            end
        elsif a == "="
            if stat == "hp"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.hp == inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "attack"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.attack == inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "defense"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.defense == inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "spec_atk"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.spec_atk == inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "spec_def"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.spec_def == inequality.to_i
                end
                puts "-----------"
                puts operationArr
            elsif stat == "speed"
                PokemonSpecies.all.select do |pokemon|
                    operationArr << pokemon.name if pokemon.speed == inequality.to_i
                end
                puts "-----------"
                puts operationArr
            end
        end
    end
end