class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs, :artists

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

    def songs
        @songs
    end

    def self.create(name)
        self.new(name).tap {|genre| genre.save}
   
    end 


  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end


    # def self.find_by_name(name)
    #     @@all.detect{|genre| genre.name == name}
    # end

    def artists
        self.songs.collect {|s| s.artist}.uniq
      end

end