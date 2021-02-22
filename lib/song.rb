class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre

  
    @@all = []
  
    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = (artist) if artist != nil
      self.genre = (genre) if genre != nil 
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

    def self.find_by_name(name)
        @@all.detect{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)

        self.find_by_name(name) || self.create(name)

    end

    def genre=(genre)
        @genre = genre
        if !(genre.songs.include?(self))
            genre.songs << self
      end
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end



  end