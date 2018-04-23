class MuseumFinder::CLI

  def call
      MuseumFinder::Scraper.scrape_landing_page
      greeting
      start
    end

  def start
    x = 0
    y = 4
    print_menu(x, y)

    until y >= MuseumFinder::Museum.all.length
    menu_input = gets.strip
      if menu_input == "more"
        x += 5
        y += 5
        print_menu(x, y)
      end
    end

      input = nil
      until input == "exit"
        input = gets.strip
      if input.to_i >= 1 && input.to_i <= MuseumFinder::Museum.all.length
        museum = MuseumFinder::Museum.find(input.to_i)
        print_museum(museum)
      elsif input == "menu"
        print_menu
      elsif input != "exit"
        puts "Sorry, I don't recognize your entry. Please try again.".colorize(:red)
      end

    end
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

    def print_menu(lower, upper)
      puts "Which Smithsonian property do you wish to view?".colorize(:light_blue)
      MuseumFinder::Museum.all.each_with_index do |museum, index|
        if index >= lower && index <= upper
          puts " #{index + 1}. #{museum.name}"
        end
    end
      puts "\n"
      puts "Please enter the number preceding the museum (or zoo) for more information."
      puts "Or type 'more' to see more museums" unless upper >= MuseumFinder::Museum.all.length
      puts "Type 'exit' at any time to end this program."

    end

    def print_all
      puts "Which Smithsonian property do you wish to view?".colorize(:light_blue)
      MuseumFinder::Museum.all.each_with_index do |museum, index|
        puts " #{index + 1}. #{museum.name}"
      end
      puts "\n"
      puts "Please enter the number preceding the museum (or zoo) for more information."
      puts "Type 'exit' at any time to end this program."
    end

    def print_museum(museum)
      puts "\n"
      puts "#{museum.full_name}".upcase.colorize(:light_blue)
      puts "\n"
      puts "#{museum.description}"
      puts "\n"
      puts "Highlights: ".colorize(:yellow) + "#{museum.highlights}"
      puts "Location: ".colorize(:yellow) + "#{museum.location}"
      puts "Hours: ".colorize(:yellow) + "#{museum.hours}"
      puts "Admission: ".colorize(:yellow) + "#{museum.admission}"
      puts "More Info: ".colorize(:yellow) + "#{museum.url}"
      puts "\n"

      another museum?
    end

    def another_museum?
      puts "Would you like to see another museum? If you know the number, enter it below."
      puts "Type 'menu' to return to the Main Menu or 'exit' to end this program."
      puts "\n"
    end

    def goodbye
      puts "Thanks for exploring the Smithsonian Institution. Enjoy your visit!".colorize(:light_blue)
      puts "\n"
    end

end
