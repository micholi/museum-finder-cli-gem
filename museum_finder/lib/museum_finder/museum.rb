class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :hours, :admission, :overview, :highlights, :transportation

  @@all = []

    def initialize(name = nil, url = nil, location = nil)
      @name = name
      @url = url
      @location = location
      @@all << self
    end

    def self.all
      @@all
    end

    def self.new_museum

      # placeholder - may change
      # put code here
      museums = MuseumFinder::Scraper.scrape_landing_page
      #museums.css(".title").each do |museum|
      museums.css("div.inner").each do |museum|
        self.new(
        museum.css("h3.title").text,
        "https://www.si.edu#{museum.css("h3.title a").attribute("href").text}",
        museum.css("p.location").text.delete("\n").strip
        )
binding.pry

      #museums.css("h3.title").each do |museum|


    end
  end

    def self.museum_info

    end

end
