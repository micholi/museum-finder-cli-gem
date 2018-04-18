class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :hours, :admission, :description, :highlights, :transportation

  @@all = []

    def initialize(name = nil, url = nil, location = nil)
      @name = name
      @url = url
      @location = location
    end

    def self.all
      @@all ||= self.new_museum
    end

    def save
      @@all << self
    end

    def self.create_museums

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


    #museum_page = Nokogiri::HTML(open("https://www.si.edu/museums/american-history-museum"))
    #  museum_page.css("div.edan-record--location").each do |museum|
    #    name = museum.css("h1.page-title")
    #    address = museum.css("div.location-address").children[0].text.delete("\n").strip
    #    city = museum.css("div.location-address").children[2].text.strip
    #    hours = museum.css("div.location-hours").text.gsub(/\r\n/," - ").strip
    #    admission = museum.css("div.location-admission").text.delete("\n").strip
    #    about = museum.css("div.info p").children[0].text
    #    highlights = museum.css("div.info p").children[1].text

    def full_name
      @full_name = doc.css("h1.page-title").text

    end

    def hours
      doc.css("div.location-hours").text.gsub(/\r\n/," - ").strip
    end

    def admission
      doc.css("div.location-admission").text.delete("\n").strip
    end

    def description
      doc.css("div.info p").children[0].text
    end

    def highlights
      doc.css("div.info p").children[1].text
    end

    def doc
      @doc ||= Nokogiri::HTML(open(self.url))
    end

end
