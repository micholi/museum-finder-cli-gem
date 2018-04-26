class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :full_name, :hours, :admission, :description, :highlights

  @@all = []

    def initialize(museum_hash)
      museum_hash.each do |attribute, value|
        self.send("#{attribute}=", value)
      end
      
      @@all << self
    end

    def self.create_museums
      MuseumFinder::Scraper.scrape_landing_page.each do |museum_hash|
        self.new(museum_hash)
      end
    end

    def add_museum_attributes
      MuseumFinder::Scraper.scrape_museum_page(self.url).each do |key, value|
        self.send("#{key}=", value)
      end
    end

    def self.all
      @@all
    end

    def self.find(number)
      self.all[number-1]
    end

end
