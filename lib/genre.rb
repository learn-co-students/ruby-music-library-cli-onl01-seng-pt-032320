class Genre
    extend Concerns::Findable
    attr_reader :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def name=(name)
        @name = name
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
        self.new(name)
    end

    def add_song(song)
        @songs << song
    end

    def artists
        @songs.collect {|song| song.artist}.uniq
    end
end