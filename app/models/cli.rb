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
            Thank you for using the Pokemon simulator. \n\n
            Please type in the name of a Pokemonn to add it to your team.
            Enter 'view' to view your current team.
            Enter 'delete' to remove a Pokemon from your current team.

            Please see the below options if you need to sift through all of the options.
            Enter 'all' to list all Pokemon.
            Enter 'elements' to list all elements.
            Enter 'stats' to list all Pokemon stat types.
            Enter an element like 'water' to list all Pokemon of that element.
            Enter a stat to create a conditional.
            
            Enter 'exit' to quit."


            selection = STDIN.gets.chomp
            # binding.pry
            if selection == "all"
                allPokemon
            elsif selection == "elements"
                puts "---------------"
                puts elementArray
                puts "---------------"

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
            No duplicates plz. This Pokemon was not added. 
            Current List: #{calledPokemon}\n\n"
                elsif
                    calledPokemon.length == 6
                    puts "
            You must remove a Pokemon from your team. There is a limit of 6 Pokemon per team.
            Current List: #{calledPokemon}\n\n"
                else
                    calledPokemon << selection
                    trainer.addPokemonToTeam(selection)
                    puts "
            The Pokemon, #{selection}, has been added to your collection.
                    "
                end
            elsif selection == "view"
                trainer.ownedPokemon
            elsif selection == "delete"
                trainer.abandonPokemon
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