class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :hours, :admission, :overview, :highlights, :transportation

  @@all = []

    def initialize(name = nil, url = nil, location = nil)
      @name = name
      @url = url
      @location = location
    #  @@all << self
    end

    def self.all
      @@all ||= self.new_museum
    end

    def save
      @@all << self
    end

    def self.new_museum

      # placeholder - may change
      # put code here
      museums = MuseumFinder::Scraper.scrape_landing_page

        museums.css("div.b-text-wrapper").each do |m|
          museum = self.new(
          m.css("h3.title").text,
          "https://www.si.edu#{m.css("h3.title a").attribute("href").text}",
          m.css("p.location").children[0].text.delete("\n").strip
          )
          museum.save
        end
    end


    def full_name

    end

    def hours

    end

    def admission

    end

    def description

    end

    def highlights

    end

end
