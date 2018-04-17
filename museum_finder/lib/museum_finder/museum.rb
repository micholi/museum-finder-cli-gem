class MuseumFinder::Museum

  attr_accessor :name, :location, :hours, :admission, :overview, :highlights, :transportation

  @@all = []

    def initialize(name = nil, url = nil)
      @name = name
      @url = url
    end

    def self.all
      @@all
    end

    def self.new_museum

      # placeholder - may change
      # put code here
      museums = MuseumFinder::Scraper.scrape_landing_page
      museums.css("h3.title").each do |museum|
        museum.text

      binding.pry
    end
  end

    def self.museum_info

    end

end
