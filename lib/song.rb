class Song
    extend Findable
    attr_accessor :songs, :name
  
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
        self.new(name).tap {|song| song.save}
   
    end 

   

  end