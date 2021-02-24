require 'pry'
class Artist
    extend Concerns::Findable
    attr_accessor  :name, :songs, :genres
  
    @@all = []
  
    def initialize(name)
        # binding.pry
      @name = name
 
      @songs = []
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
        # binding.pry
        self.new(name).tap {|artist| artist.save}
   
    end 

    def add_song(song)
        song.artist = self unless song.artist == self
        @songs << song unless @songs.include?(song)
    end 

    # def songs
    #     Song.all.select {|song| song.artist == self}
    # end

    def genres

        genres = @songs.collect { |song| song.genre}.uniq
      end


  end