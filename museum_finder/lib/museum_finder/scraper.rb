class MuseumFinder::Scraper

def self.scrape_museums_landing_page
    museums_landing = Nokogiri::HTML(open("https://www.si.edu/museums"))
    #museums = []

    name = museums_landing.css("h3.title").text
    binding.pry
    url =museums_landing.css("h3.title a")

  end

  def self.scrape_museum_info_page

  end


end
