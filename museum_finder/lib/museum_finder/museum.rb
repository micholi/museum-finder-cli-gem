class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :full_name, :hours, :admission, :description, :highlights

  @@all = []

    def initialize(name = nil, url = nil, location = nil)
      @name = name
      @url = url
      @location = location
      save
    end

    def self.all
      @@all
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
