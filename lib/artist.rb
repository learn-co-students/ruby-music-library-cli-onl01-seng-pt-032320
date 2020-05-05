class Artist
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
        @@all << self # or self.class.all < self
        #calling the all method of the class and shoveling in whatever is the receiver of the method
    end

    def self.create(name)
        artist = new(name)
        artist.save
        artist 
    end

    def add_song(song) #instance 
        song.artist = self unless song.artist
        songs.push song unless songs.include?(song)
    end

    def genres 
        songs.collect(&:genre).uniq
    end
end