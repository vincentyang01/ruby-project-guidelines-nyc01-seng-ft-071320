class CLI
    # binding.pry
puts "Hello1"
    def start
        user = Trainer.login
        puts "Hello2"
        if user
            puts "Thank you for using the Pokemon simulator. 
            Please type in the name of a Pokemonn to add it to your team.
            Please see the below options if you need to sift through all of the options.
            
            Enter 'all' to list all Pokemon.
            Enter 'all elements' to list all elements.
            Enter 'stats' to list all Pokemon stat types.
            Enter 'water' to list all Pokemon of that element.
            Enter 'hp > 60' to list all Pokemon with a base hp stat over 60."


            selection = gets.chomp
            #binding.pry
            if selection == "all"
                Pokemon.all.each do |pokemon|
                    puts pokemon.name
                end
            elsif selection == "all elements"   
            elsif selection == "stats"  
            elsif selection == ""  #if Pokemon.elements array includes selection, filter or map by selection puts
            elsif selection == ""  #Filter by stat
            #elsif data.includes(selection)
            #    InstanceOfPokemon.new(where name)
            elsif put "Invalid entry. Please try again"
            end
        end
        puts "This user does not"
    end
end