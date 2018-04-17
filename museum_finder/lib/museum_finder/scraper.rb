class MuseumFinder::Scraper

  def self.scrape_museums_landing_page
    museums_landing = Nokogiri::HTML(open("https://www.si.edu/museums"))
    #museums = []

    link = museums_landing.css("h3.title").children.css("a").map { |x| x.attribute('href').value}
      link.each do |y|
      @url = "https://si.edu/#{y}"



    museums_landing.css("h3.title").each_with_index do |museum, index|
      museum_name = museum.text
      number = index + 1
    end
    end
  end

  def self.scrape_test
    museums_landing = Nokogiri::HTML(open("https://www.si.edu/museums"))
    #museums = []

    link = museums_landing.css("h3.title").children.css("a").map { |x| x.attribute('href').value}
      link.each do |y|
      url = "https://si.edu/#{y}"

    end
    end

  def self.scrape_museum_info_page
    # placeholder for testing
    museum_page = Nokogiri::HTML(open("https://www.si.edu/museums/american-history-museum"))
    museum_page.css("div.location-info").each do |museum|
      address = museum.css("div.location-address").children[0].text.delete("\n").strip
      city = museum.css("div.location-address").children[2].text.strip

    binding.pry

  end
  end


end
