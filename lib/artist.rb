class Artist
    attr_accessor :name, :song, :genre

    extend Concerns::Findable

    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
        @songs = []
        @genre = genre
    end

    def self.all 
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
     end

     def add_song(song)
        if !@songs.include?(song)
            @songs << song 


        end
        if !(song.artist)
            song.artist = self
        end
            
    end

      def songs 
        @songs
        #  Song.all.select do |song|
        #   song.artist == self
        #   song
      
      end 

      def genres
         newarray = []
        songs.map do |song|
         newarray << song.genre
         
        
        end
        newarray.uniq

      end


end