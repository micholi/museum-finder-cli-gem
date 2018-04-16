class MuseumFinder::CLI

  def call
      # initial code for testing purposes
      puts "WELCOME TO THE SMITHSONIAN INSTITUTION!"
      puts "\n"
      puts "The Smithsonian Institution is the world's largest museum, education, and research complex."
      puts "The Smithsonian offers 17 museums, galleries, and a zoo in the Greater Washington, DC area and 2 additional museums in New York City."
      puts "\n"
      menu
    end

    def menu
      # placeholder code for testing
      # update with revised code later
      puts "Which museum (or zoo) do you wish to explore further?"
      puts "Please enter the number preceding its name for more information:"
      puts "  [1] African American Museum"
      puts "  [2] African Art Museum"
      puts "  [3] Air and Space Museum"
      puts "  [4] Air and Space Museum Udvar-Hazy Center"
      puts "  [5] American Art Museum"
      puts "  [6] American History Museum"
      puts "  [7] American Indian Museum"
      puts "  [8] American Indian Museum Heye Center"
      puts "  [9] Anacostia Community Museum"
      puts "  [10] Archives of American Art"
      puts "  [11] Arts and Industries Building"
      puts "  [12] Cooper Hewitt"
      puts "  [13] Freer Gallery of Art"
      puts "  [14] Hirshhorn"
      puts "  [15] National Zoo"
      puts "  [16] Natural History Museum"
      puts "  [17] Portrait Gallery"
      puts "  [18] Postal Museum"
      puts "  [19] Renwick Gallery"
      puts "  [20] S. Dillon Ripley Center"
      puts "  [21] Sackler Gallery"
      puts "  [22] Smithsonian Castle"
      puts "  [23] Smithsonian Gardens"
    end

    def museum_info
      input = gets.strip
      case input
      when "1"
        puts "More info on African American Museum"
    end

end
