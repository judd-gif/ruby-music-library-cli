module Concerns::Findable

    def find_by_name

    self.all.detect{|o| o.name == name}

    end 

    def self.find_or_create_by_name(name)
        find_by_name(name) || self.create(name)
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


end