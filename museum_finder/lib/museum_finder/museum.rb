class MuseumFinder::Museum

  attr_accessor :name, :url, :location, :full_name, :hours, :admission, :description, :highlights

  @@all = []

    def initialize(museum_hash)
      museum_hash.each do |attribute, value|
        self.send("#{attribute}=", value)


      #@name = name
      #@url = url
      #@location = location
end
      @@all << self
    #end
    end

    def self.create_museums
      MuseumFinder::Scraper.scrape_landing_page.each do |museum_hash|
        self.new(museum_hash)
        #museum.name = name
        #binding.pry
      end
    end

  #  def self.get_museum_attributes
    #  @@all.each do |museum|
  #  create_museums
      #  url = museum.url
  #    hash = MuseumFinder::Scraper.scrape_museum_page(url)
  #    hash.each do |key, value|
  #      binding.pry
  #      self.send("#{key}=", value)
  #    end
  #  end



def add_museum_attributes
  #create_museums
  #get_museum_attributes
#  @@all.each do |museum|

    url = self.url
    MuseumFinder::Scraper.scrape_museum_page(url).each do |key, value|
      #binding.pry

      self.send("#{key}=", value)


  #  end
  end
end


    def self.all
      #create_museums
      @@all

    end




  #  def full_name
  #    @full_name ||= doc.css("h1.page-title").text
  #  end

    #def hours
    #  @hours ||= doc.css("div.location-hours").text.gsub(/\r\n/," - ").strip
    #end

  #  def admission
  #    @admission ||= doc.css("div.location-admission").text.delete("\n").strip
  #  end

  #  def description
  #    @description ||= doc.css("div.info p").children[0].text
  #  end

#    def highlights
#      @highlights ||= doc.css("div.info p").children[1].text
#    end

    def self.find(number)
      self.all[number-1]
    end

#    def doc
#      @doc ||= Nokogiri::HTML(open(self.url))
#    end

end
