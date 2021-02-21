class Genre

    attr_accessor :name, :songs
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
        self.new(name).tap {|genre| genre.save}
   
    end 

    def self.find_by_name(name)
        @@all.detect{|genre| genre.name == name}
    end

end