class MuseumFinder::Scraper

  def self.get_page
    museums_landing = Nokogiri::HTML(open("https://www.si.edu/museums"))
  end

  def self.scrape_landing_page
    self.get_page.css("div.content")
  end

end
