class Artist
    attr_accessor :artist, :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
      save 
    end
  
    def self.all
      @@all
    end

    def save 
        @@all << self
    end

    def self.destroy_all
    @@all.clear
    end 

    def self.create(name)
        self.new(name).tap {|artist| artist.save}
   
    end 

    def self.find_by_name(name)
        @@all.detect{|artist| artist.name == name}
    end


  end