class CLI

    def start
        user = User.login
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
            if selection == "all"   puts "in all"
            elsif selection == "all elements"   puts "in elements"
            elsif selection == "stats"  puts "in stats"
            elsif selection == "" puts "in element list" #if Pokemon.elements array includes selection, filter or map by selection puts
            elsif selection == "" puts "in stat equality" #Filter by stat
            elsif puts "Invalid entry. Please try again"
            end
        end
        puts "This user does not"
    end
end