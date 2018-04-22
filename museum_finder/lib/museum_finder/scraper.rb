class MuseumFinder::Scraper

  def self.get_page
    Nokogiri::HTML(open("https://www.si.edu/museums"))
  end

  def self.scrape_landing_page
    museums_landing = self.get_page.css("div.content")

        museums_landing.css("div.b-text-wrapper").each do |museum|
          name = museum.css("h3.title").text
          url = "https://www.si.edu#{museum.css("h3.title a").attribute("href").text}"
          location = museum.css("p.location").children[0].text.delete("\n").strip
          MuseumFinder::Museum.new(name, url, location)
        end
  end

end
