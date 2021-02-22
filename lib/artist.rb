class Artist
    extend Concerns::Findable
    attr_accessor  :name, :songs, :genres
  
    @@all = []
  
    def initialize(name)
      @name = name
      @@all << self
      @songs = []
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

    def self.find_or_create_by_name(name)
        self.all.detect{ |artist| artist.name == name }  || Artist.new(name)
       end

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless @songs.include?(song)
    end 

    # def songs
    #     Song.all.select {|song| song.artist == self}
    # end

    def genres
        songs.collect { |song| song.genre}.uniq
      end


  end