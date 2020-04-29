class Genre
    attr_accessor :name 

    extend Concerns::Findable

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
        @songs =[]
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
         genre = self.new(name)
         genre.save
         genre
      end

      def songs 
        @songs
      end

      def add_song(song)
        if !@songs.include?(song)
            @songs << song 


        end
        if !(song.genre)
            song.genre = self
        end
    end 

    def artists
        newarray = []
        songs.map do |song|
           newarray << song.artist
        end

        newarray.uniq
    end
      

end