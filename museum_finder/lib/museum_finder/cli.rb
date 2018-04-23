class MuseumFinder::CLI

  def call
    MuseumFinder::Scraper.scrape_landing_page
    greeting
    start
  end

  def start
    x = 0
    y = 4
    input = nil

    print_menu(x, y)

    while input != "exit"
      #&& y <= MuseumFinder::Museum.all.length-1
      input = gets.strip

      if input == "more" && y <= MuseumFinder::Museum.all.length-1
        x += 5
        y += 5
        print_menu(x, y)

      elsif input.to_i >= 1 && input.to_i <= MuseumFinder::Museum.all.length
        museum = MuseumFinder::Museum.find(input.to_i)
        print_museum(museum)

      elsif input == "menu"
        x = 0
        y = 4
        print_menu(x,y)

      elsif input == "all"
        print_all

      elsif input != "exit"
        puts "Sorry, I don't recognize your entry. Please try again.".colorize(:red)

      end
    #end
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
      puts "Which Smithsonian property do you wish to view?".colorize(:light_blue) if lower == 0
      puts "Displaying museums #{lower+1} to #{upper+1} (of #{MuseumFinder::Museum.all.length}):".colorize(:yellow)

      MuseumFinder::Museum.all.each_with_index do |museum, index|
        if index >= lower && index <= upper
          puts " #{index + 1}. #{museum.name}"
        end
      end

      puts "Type 'more' to see the next 5 museums." unless upper >= MuseumFinder::Museum.all.length
      puts "\n"
      puts "To choose one of the museums above, enter its number."
      puts "Type 'all' to list all museums or 'exit' to end this program."
    end

    def print_all
      puts "Which Smithsonian property do you wish to view?".colorize(:light_blue)

      MuseumFinder::Museum.all.each_with_index do |museum, index|
        puts " #{index + 1}. #{museum.name}"
      end

      puts "\n"
      puts "Please enter the number preceding the museum (or zoo) for more information."
      puts "Type 'exit' to end this program."
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

      another_museum?
    end

    def another_museum?
      puts "Would you like to see another museum? Enter its number below."
      puts "Type 'menu' to return to the Main Menu or 'exit' to end this program."
      puts "\n"
    end

    def goodbye
      puts "\n"
      puts "Thanks for exploring the Smithsonian Institution. Enjoy your visit!".colorize(:light_blue)
      puts "\n"
    end

end
