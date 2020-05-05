class Genre
    extend Concerns::Findable
    attr_accessor :name 
    attr_reader :songs 
    

    @@all = [] 
    def initialize(name)
    @name = name 
    @songs = [] 
    end 

    def self.all 
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def save 
        @@all << self #or self.class.all < self
        #calling the all method of the class and shoveling in whatever is the receiver of the method
    end

    def self.create(name)
        genre = new(name)
        genre.save
        genre
    end

    def artists
        artist_list = self.songs.map do |song_obj| #you can call artist on 
            song_obj.artist
        end
        artist_list.uniq
    end


end