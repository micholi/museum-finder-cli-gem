class MuseumFinder::CLI

  def call
      # initial code for testing purposes
      puts "WELCOME TO THE SMITHSONIAN INSTITUTION!"
      puts "\n"
      puts "The Smithsonian Institution is the world's largest museum, education, and research complex."
      puts "The Smithsonian offers 17 museums, galleries, and a zoo in the Greater Washington, DC area and 2 additional museums in New York City."
      puts "\n"
      menu
      museum_input
      goodbye
    end

    def menu
      # placeholder code for testing
      # update with revised code later
      puts "Which museum (or zoo) do you wish to explore further?"
      # puts "Please enter the number preceding its name for more information:"
      MuseumFinder::Museum.all.each_with_index do |museum, index|
        puts "#{index + 1}. #{museum.name}"
      end
    #end
    end

    def museum_input
      puts "Please enter the number preceding its name for more information:"
      input = nil
      while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "More info..."
      when "2"
        puts "More info..."
      when "3"
        puts "More info..."
      when "4"
        puts "More info..."
      when "5"
        puts "More info..."
      when "6"
        puts "More info..."
      when "7"
        puts "More info..."
      when "8"
        puts "More info..."
      when "9"
        puts "More info..."
      when "10"
        puts "More info..."
      end
    end
    end

    def goodbye
      puts "Thanks for exploring the Smithsonian Institution. Hope you enjoy your visit!"
    end

end
