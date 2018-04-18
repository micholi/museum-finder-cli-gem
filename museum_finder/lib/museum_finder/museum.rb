class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :hours, :admission, :description, :highlights

  @@all = []

    def initialize(name = nil, url = nil, location = nil)
      @name = name
      @url = url
      @location = location
    end

    def self.create_museums
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

    def self.all
      @@all ||= self.new_museum
    end

    def save
      @@all << self
    end

    def full_name
      @full_name ||= doc.css("h1.page-title").text
    end

    def hours
      @hours ||= doc.css("div.location-hours").text.gsub(/\r\n/," - ").strip
    end

    def admission
      @admission ||= doc.css("div.location-admission").text.delete("\n").strip
    end

    def description
      @description ||= doc.css("div.info p").children[0].text
    end

    def highlights
      @highlights ||= doc.css("div.info p").children[1].text
    end

    def self.find(number)
      self.all[number-1]
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
