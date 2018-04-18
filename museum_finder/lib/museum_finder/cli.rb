class MuseumFinder::CLI

  def call
      MuseumFinder::Scraper.new.create_museums
      greeting
      start
    end

  def start
      menu
      museum_input
      #print_museum(museum)
      goodbye
    end

    def greeting
      puts "\n"
      puts "WELCOME TO THE SMITHSONIAN INSTITUTION!".colorize(:light_blue)
      puts "\n"
      puts "The Smithsonian Institution is the world's largest museum, education, and research complex."
      puts "The Smithsonian offers 17 museums, galleries, and a zoo in the Greater Washington, DC area "
      puts "and 2 additional museums in New York City."
      puts "\n"
    end

    def menu
      # placeholder code for testing
      # update with revised code later
      puts "Which museum (or zoo) do you wish to explore further?"
      # puts "Please enter the number preceding its name for more information:"
      MuseumFinder::Museum.all.each_with_index do |museum, index|
        puts " #{index + 1}. #{museum.name}"

      end
      puts "\n"
      puts "Please enter the number preceding its name for more information:"
    #end
    end

    def museum_input

      input = nil
      until input == "exit"
      input = gets.strip

      #puts "Type 'list' to view the complete list of museums."
      #puts "Or type 'exit' to end this program."

      #input = input.to_i
      if input.to_i >= 1
        museum = MuseumFinder::Museum.find(input.to_i)
        print_museum(museum)
        puts "Would you like to see another museum?"
      end
    end
    end

    def print_museum(museum)
      puts "#{museum.full_name}".upcase.colorize(:light_blue)
      puts "\n"
      puts "#{museum.description}"
      puts "\n"
      #puts "Description: ".colorize(:yellow) + "#{museum.description}"
      puts "Highlights: ".colorize(:yellow) + "#{museum.highlights}"
      puts "Location: ".colorize(:yellow) + "#{museum.location}"
      puts "Hours: ".colorize(:yellow) + "#{museum.hours}"
      puts "Admission: ".colorize(:yellow) + "#{museum.admission}"
      puts "\n"
    end

    def goodbye
      puts "Thanks for exploring the Smithsonian Institution. Hope you enjoy your visit!".colorize(:yellow)
    end

end
