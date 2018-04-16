class MuseumFinder::Scraper

def self.scrape_museums_landing_page
    doc = Nokogiri::HTML(open("https://www.si.edu/museums"))
  end

  def self.scrape_museum_info_page

  end


end
