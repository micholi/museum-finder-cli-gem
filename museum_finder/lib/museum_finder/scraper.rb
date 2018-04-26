class MuseumFinder::Scraper

  def self.get_page
    Nokogiri::HTML(open("https://www.si.edu/museums"))
  end

  def self.scrape_landing_page
    museums_array = []

    landing_page = self.get_page.css("div.content")

      landing_page.css("div.b-text-wrapper").each do |museum|
        name = museum.css("h3.title").text
        url = "https://www.si.edu#{museum.css("h3.title a").attribute("href").text}"
        location = museum.css("p.location").children[0].text.delete("\n").strip

        museum = {:name => name, :url => url, :location => location}
        museums_array << museum
      end
    museums_array
  end

  def self.scrape_museum_page(url)
    doc = Nokogiri::HTML(open(url))

    full_name = doc.css("h1.page-title").text
    hours = doc.css("div.location-hours").text.gsub(/\r\n/," - ").strip
    admission = doc.css("div.location-admission").text.delete("\n").strip
    description = doc.css("div.info p").children[0].text
    highlights = doc.css("div.info p").children[1].text

    museum_listing = {:full_name => full_name, :hours => hours, :admission => admission, :description => description, :highlights => highlights}
    museum_listing
  end

end
